#include <iostream>
#include "ros/ros.h" 
#include <ctime> 

int main(int argc, char **argv)
{
	ros::init(argc, argv, "timer_node");

    ros::NodeHandle nh;
    ros::Rate loop_rate(2);// 1 time every 0,5 seconds. So, frequency = 1/period, period = 0,5
                           // frequency = 1/0,5 = 2 Hz

    while (ros::ok())
    {
        std::time_t now = std::time(NULL);
        char date[100];
        strftime(date, 100, "%H.%M.%S %d.%m.%Y", std::localtime(&now));
        //ROS_INFO_STREAM(date);
        std::cout<<date<<std::endl;
        ros::spinOnce(); 
        loop_rate.sleep();        
    }

    return 0;
}