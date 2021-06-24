#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
int main(int argc, char **argv) {
    ros::init(argc, argv, "talker"); // Initiate new ROS Node named "talker"
    ros::NodeHandle n;
    //создание publisher(first parameter is the topic name, second parameter
                                                       // is the queue size)
    ros::Publisher chatter_pub = 
        n.advertise<std_msgs::String>("chatter", 1000);
          
    ros::Rate loop_rate(10);
    int count = 0;
    while (ros::ok()) { //Keep spinning loop until user presses ctrl+c
        std_msgs::String msg;
        std::stringstream ss;
        ss << "hello world " << count;
        msg.data = ss.str();
        ROS_INFO("%s", msg.data.c_str());
        chatter_pub.publish(msg);
        ros::spinOnce();//need to call this function often to allow ros to process incoming messages
        loop_rate.sleep();//sleep for the rest of the cycle
        ++count;
    }
    return 0;
}
