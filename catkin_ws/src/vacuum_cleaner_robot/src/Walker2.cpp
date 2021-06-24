#include "Walker2.h"
#include "geometry_msgs/Twist.h"
#include <iostream>
#include <cmath>

Walker2::Walker2()
{
    commandPub = node.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

    laserSub = node.subscribe("scan", 1, &Walker2::scanCallback, this);
    
    client = node.serviceClient<gazebo_msgs::GetModelState>("/gazebo/get_model_state");
}

void Walker2::moveForward() 
{
    geometry_msgs::Twist msg;
    if(keepMoving)
    {
        msg.linear.x = (-1)*FORWARD_SPEED;
        commandPub.publish(msg);
    }
    else
    {
       while(yaw_z != ROTATE_ANGLE)
       {
            msg.angular.z = ANGULAR_SPEED;
            commandPub.publish(msg);
            setYaw_Z();
            std::cout<<"I NEED TO ROTATE TO ANGLE="<< ROTATE_ANGLE<<std::endl;
       }
       ROS_INFO("YA doshel");
       std::cout<<"ROTATE_ANGLE="<<ROTATE_ANGLE<<std::endl;
       isRotated = true;
    }
    
}

void Walker2::setYaw_Z()
{
    double quantX = 0.0;
    double quantY = 0.0;
    double quantZ = 0.0;
    double quantW = 0.0;
    
    gazebo_msgs::GetModelState gms;
    gms.request.model_name="turtlebot3";
    
    if (client.call(gms))
    {
        quantX = gms.response.pose.orientation.x;
        quantY = gms.response.pose.orientation.y;
        quantZ = gms.response.pose.orientation.z;
        quantW = gms.response.pose.orientation.w;
    }

    double t3 = 2.0 * (quantW * quantZ + quantX * quantY);
    double t4 = 1.0 - 2.0 * (quantY * quantY + quantZ * quantZ);
    yaw_z = std::atan2(t3,t4);  
    yaw_z = std::round((yaw_z+3.14)*100)/100;  
    std::cout<<"yaw_z="<<yaw_z<<std::endl;
}

void Walker2::scanCallback(const sensor_msgs::LaserScan::ConstPtr& scan)
{
    if(isRotated)
    {
        yaw_z = ROTATE_ANGLE;
    }
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

    if(isObstacleInFront)
    {
        keepMoving = false;

        float maxDistance = 0;
        int k = 0;
        for(int i=scan->ranges.size()/2;i<scan->ranges.size();i++)
        {
            std::cout<<"size="<<scan->ranges.size()<<std::endl;
            if(scan->ranges[i]>maxDistance)
            {
                maxDistance = scan->ranges[i];
                k = i;
            }

        }

        for(int i=0; i<scan->ranges.size()/2;i++)
        {
            if(scan->ranges[i]>maxDistance)
            {
                maxDistance = scan->ranges[i];
                k = i;
            }
        }

        ROTATE_ANGLE = scan->angle_min+k*scan->angle_increment;
        ROTATE_ANGLE = std::round(ROTATE_ANGLE*100)/100;
        if(yaw_z != ROTATE_ANGLE) 
        {
            isRotated = false;
        } 
    }
    
}

void Walker2::startMoving()
{
    ros::Rate rate(10);
    ROS_INFO("Start moving");
    while (ros::ok()) 
    {
        moveForward();
        ros::spinOnce();
        rate.sleep();
    }
}
