#!/usr/bin/env python  
import roslib
import rospy
import tf
import geometry_msgs.msg
import turtlesim.srv
from nav_msgs.msg import OccupancyGrid
from nav_msgs.srv import GetMap

map = OccupancyGrid()

def convertMapIndexesToCoords(i, j):
	# map_x = grid_j * map.info.resolution + map.info.origin.position.x
	# map_y = grid_i * map.info.resolution + map.info.origin.position.y
	coords = [0 , 0]

	coords[0] = j * map.info.resolution + map.info.origin.position.x

	coords[1] = i * map.info.resolution + map.info.origin.position.y

	return coords

def convertCoordsToMapIndexes(x, y):
	# grid_i = (map_y - map.info.origin.position.y) / map.info.resolution
	# grid_j = (map_x - map.info.origin.position.x) / map.info.resolution
	indexes = [0 , 0]
	#i
	indexes[0] = int((y - map.info.origin.position.y) / map.info.resolution)

	#j
	indexes[1] = int((x - map.info.origin.position.x) / map.info.resolution)

	return indexes

def requestMap():
	global map
	rospy.wait_for_service('static_map')
	print('Requesting the map...')
	try:
		getNewMap = rospy.ServiceProxy("static_map", GetMap)
		map = getNewMap().map
	except rospy.ServiceException as e:
		print("Service call failed: %s"%e)


if __name__ == '__main__':
	rospy.init_node('robot_listener')
	listener = tf.TransformListener()
	rate = rospy.Rate(2.0)
	while not rospy.is_shutdown():
		try:
			requestMap()
			(trans,rot) = listener.lookupTransform('/loaded_map', '/base_footprint', rospy.Time(0))
			print("Current position from tf: (", trans[0], ", ", trans[1], "); ")

			indexes = convertCoordsToMapIndexes(trans[0], trans[1])
			print('Current indexes from current position:[', indexes[0], ', ', indexes[1],']; ')

			coords = convertMapIndexesToCoords(indexes[0], indexes[1])
			print('Current position from current indexes:(', coords[0], ', ', coords[1],'); ')

			rate.sleep()
		except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
			continue
