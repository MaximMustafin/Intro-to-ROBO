#!/usr/bin/env python

import sys
import rospy
from nav_msgs.msg import OccupancyGrid
from clear_map_service.srv import GetMap

def clear_map_service_client():
	rospy.init_node('clear_map_service_client', anonymous=False)
	pub = rospy.Publisher('/new_map', OccupancyGrid, queue_size=10)
	print('Publishing new map to topic /new_map')
	rate = rospy.Rate(1)
	while not rospy.is_shutdown():
		rospy.wait_for_service('clear_map_service')
		try:
			getNewMap = rospy.ServiceProxy('clear_map_service', GetMap)
			response = getNewMap().map
			print('I have got a map from server. Ready to publish')
		except rospy.ServiceException as e:
			print("Service call failed: %s"%e)
		print('Publishing')
		pub.publish(response)
		rate.sleep()

if __name__ == "__main__":       
	clear_map_service_client()
