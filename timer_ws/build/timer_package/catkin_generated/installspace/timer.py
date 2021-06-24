#!/usr/bin/env python3
import rospy
import datetime

def timer() :
	rospy.init_node('timer_node', anonymous=True)
	rate = rospy.Rate(2) # 2hz
	while not rospy.is_shutdown():
		now = datetime.datetime.now()
		print(str(now.strftime("%H.%M.%S %d.%m.%Y")))
		#rospy.loginfo(str(now.strftime("%H.%M.%S %d.%m.%Y")))
		rate.sleep()

if __name__ == "__main__":
	try:
		timer()
	except rospy.ROSInterruptException: 
		pass