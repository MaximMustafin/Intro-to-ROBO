#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
import sys
import math

def pose_callback(pose):
	rospy.loginfo("x:%.2f, y:%.2f, z:%.2f\n", pose.x, pose.y, pose.theta)

def move_turtle():
	rospy.init_node('move_turtle', anonymous=False)
	pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
	rospy.Subscriber('/turtle1/pose',Pose, pose_callback)
	rate = rospy.Rate(1) # 1hz
	lin_vel = 1.0
	ang_vel = -math.pi/4
	move_forward_msg = Twist()
	rotate_msg = Twist()
	move_forward_msg.linear.x = lin_vel
	rotate_msg.angular.z = ang_vel
	while not rospy.is_shutdown():
		rate.sleep()
		pub.publish(move_forward_msg)
		rate.sleep()
		pub.publish(rotate_msg)
		rate.sleep()

if __name__ == '__main__':
	try:
		move_turtle()
	except rospy.ROSInterruptException:
		pass
