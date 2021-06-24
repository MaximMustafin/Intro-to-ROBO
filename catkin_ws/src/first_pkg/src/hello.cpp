/*
 * hello.cpp
 *
 *  Created on: Sep 15, 2017
 *      Author: lirs
 */

#include <iostream>
#include "ros/ros.h" //используем функционал ROS

int main(int argc, char **argv)//Параметры rosnode
{
	ros::init(argc, argv, "Hello");//инициирование rosnode, название nodes должно быть unique

    ros::NodeHandle nh;//дескриптор(обертка) для коммуникации с ROS
    ros::Rate loop_rate(10);//класс частоты, измеряется в Гц(10 раз в секунду), ограничение

    int count = 0;
    while (ros::ok()) // Keep spinning loop until user presses Ctrl+C, while ros::ok() - is node running?
                    //(ros::shutdown has been called by another part of the application)
    {
        //std::cout<<"hello world"<<count<<std::endl;
        ROS_INFO_STREAM("hello world" << count);

        ros::spinOnce(); // Allow ROS to process incoming messages(предоставление возможности другим функциям)
        loop_rate.sleep(); // Sleep for the rest of the cycle(задержка до необходимого loop_rate)
        count++;
    }

    return 0;
}


