#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
import sys
import math
from gazebo_msgs.srv import GetModelState

class Walker2:                
	ROTATE_ANGLE = -1.0
	yaw_z = 3.14
	FORWARD_SPEED = 0.4
	ANGULAR_SPEED = 0.5
	MIN_SCAN_ANGLE = math.pi - (10.0/180.0*math.pi)
	MAX_SCAN_ANGLE = math.pi + (10.0/180.0*math.pi)
	MIN_DIST_FROM_OBSTACLE = 0.5
	keepMoving = True
	isRotated = False

	def __init__(self):
		pass

	def setYaw_z(self):	
		model_coordinates = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
		resp_coordinates = model_coordinates('turtlebot3', 'wheel_left_link')		
		quantX = resp_coordinates.pose.orientation.x
		quantY = resp_coordinates.pose.orientation.y
		quantZ = resp_coordinates.pose.orientation.z
		quantW = resp_coordinates.pose.orientation.w
		t3 = 2.0 * (quantW * quantZ + quantX * quantY)
		t4 = 1.0 - 2.0 * (quantY * quantY + quantZ * quantZ)
		self.yaw_z = math.atan2(t3, t4)
		self.yaw_z = round(self.yaw_z+ 3.14, 2)
		print("yaw_z=", self.yaw_z)

	def start_move(self):
		rospy.init_node('walker', anonymous=False)
		pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
		sub = rospy.Subscriber('scan', LaserScan, self.scanCallback)
		rate = rospy.Rate(10) # 10hz
		while not rospy.is_shutdown():
			if self.keepMoving:
				vel = Twist()
				vel.linear.x = (-1)*self.FORWARD_SPEED
				pub.publish(vel)
				rate.sleep()
			else:
				vel = Twist()
				while self.yaw_z != self.ROTATE_ANGLE:
					vel.angular.z = self.ANGULAR_SPEED
					pub.publish(vel)
					self.setYaw_z()
					print("I NEED TO ROTATE TO ANGLE", self.ROTATE_ANGLE)
				print("YA doshel")
				print("ROTATE_ANGLE=", self.ROTATE_ANGLE)
				self.isRotated = True
				rate.sleep()

	def scanCallback(self, msg):
		if self.isRotated:
			self.yaw_z = self.ROTATE_ANGLE;
		isObstacleInFront = False
		self.keepMoving = True
		minIndex = round((self.MIN_SCAN_ANGLE - msg.angle_min) / msg.angle_increment)
		maxIndex = round((self.MAX_SCAN_ANGLE - msg.angle_min) / msg.angle_increment)
		currIndex = minIndex + 1
		while currIndex <= maxIndex:
			if msg.ranges[int(currIndex)] < self.MIN_DIST_FROM_OBSTACLE:
				isObstacleInFront = True
				break
			currIndex = currIndex + 1
		if isObstacleInFront:
			self.keepMoving = False
			maxDistance = 0
			k = 0
			i = 150
			while i<360:
				if msg.ranges[int(i)]>maxDistance:
					maxDistance = msg.ranges[int(i)]
					k = i;
				i = i + 1
			i = 0
			while i<150:
				if msg.ranges[int(i)]>maxDistance:
					maxDistance = msg.ranges[int(i)]
					k = i;
				i = i + 1
			self.ROTATE_ANGLE = msg.angle_min + k * msg.angle_increment
			self.ROTATE_ANGLE = round(self.ROTATE_ANGLE, 2)
			if self.yaw_z != self.ROTATE_ANGLE:
				self.isRotated = False
			print("maxDistance=", maxDistance)

if __name__ == '__main__':
	try:
		walker = Walker2()
		walker.start_move()
	except rospy.ROSInterruptException:
		pass
