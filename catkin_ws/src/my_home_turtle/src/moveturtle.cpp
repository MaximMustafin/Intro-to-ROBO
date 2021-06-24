#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"

#define PI 3.142

void poseCallback(const turtlesim::PoseConstPtr& msg) // Topic messages callback
{
  ROS_INFO("x: %.2f, y: %.2f, z: %.2f", msg->x, msg->y, msg->theta);
}

int main(int argc, char ** argv)
{
    const double FORWARD_SPEED_MPS = 1.0;
    const double ANGULAR_SPEED_DEGREES = PI/4;

    ros::init(argc, argv, "move_turtle"); 
    ros::NodeHandle node;

    ros::Publisher pub = node.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 10);  
    ros::Subscriber sub = node.subscribe("turtle1/pose", 1, poseCallback);
    
    geometry_msgs::Twist rotate_msg;
    rotate_msg.angular.z = ANGULAR_SPEED_DEGREES;

    geometry_msgs::Twist move_forward_msg;
    move_forward_msg.linear.x = FORWARD_SPEED_MPS;

    ros::Rate rate(1);
    ROS_INFO("Starting to move forward");

    while (ros::ok())
    {
      rate.sleep();
      ros::spinOnce();
      rate.sleep();

      pub.publish(move_forward_msg);
      rate.sleep();
 
      pub.publish(rotate_msg);
      rate.sleep();
    
    }

    return 0;
    
}