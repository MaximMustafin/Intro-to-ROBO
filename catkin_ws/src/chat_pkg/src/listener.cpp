#include "ros/ros.h"
#include "std_msgs/String.h"
//Topic messages callback
void chatterCallback(const std_msgs::String::ConstPtr& msg) {
    ROS_INFO("I heard: [%s]", msg->data.c_str());
}
int main(int argc, char **argv) {
    //Initiate a new ros node name "listener"
    ros::init(argc, argv, "listener"); ros::NodeHandle n;
    ros::Subscriber sub = 
        n.subscribe("chatter", 1000, chatterCallback);//creting subscriber
        //1 topic name
        //2 queue size
        //3 finction to handle the message
    ros::spin();//enter a loop pumping callbacks, program is stucked here,
    // gives control over to ROS which allows it to call all user callbacks
    // will not return until the node has been shutdown 
    return 0;
}
//