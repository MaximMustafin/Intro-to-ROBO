#include "Walker.h"
#include "geometry_msgs/Twist.h"
#include <iostream>

Walker::Walker()
{
    commandPub = node.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

    laserSub = node.subscribe("scan", 1, &Walker::scanCallback, this);
}

void Walker::moveForward() 
{
    geometry_msgs::Twist msg; 
    if(keepMoving)
    {
        msg.linear.x= (-1)*FORWARD_SPEED;
        commandPub.publish(msg);
    }
    else
    {
        ROS_INFO("Rotating to find free space");
        msg.angular.z = ANGULAR_SPEED;
        commandPub.publish(msg);
    }
    
}

void Walker::scanCallback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
    bool isObstacleInFront = false;
    keepMoving = true;

    int minIndex = ceil((MIN_SCAN_ANGLE - scan->angle_min) / scan->angle_increment);
    int maxIndex = floor((MAX_SCAN_ANGLE - scan->angle_min) / scan->angle_increment);

    for (int currIndex = minIndex + 1; currIndex <= maxIndex; currIndex++) {
        if (scan->ranges[currIndex] < MIN_DIST_FROM_OBSTACLE) {
            isObstacleInFront = true;
            break;
        }
    }
    std::cout << "isObstacleInFront = " << std::boolalpha << isObstacleInFront << std::endl;
    if (isObstacleInFront && keepMoving) {
        ROS_INFO("Stop!");
        geometry_msgs::Twist msg; 
        msg.linear.x = 0.0;
        commandPub.publish(msg);
        keepMoving = false;    
    }
}

void Walker::startMoving()
{
    ros::Rate rate(10);
    ROS_INFO("Start moving");

    // Keep spinning loop until user presses Ctrl+C or the robot got too close to an obstacle
    while (ros::ok()) {
        moveForward();
        ros::spinOnce(); // Need to call this function often to allow ROS to process incoming messages
        rate.sleep();
    }
}
