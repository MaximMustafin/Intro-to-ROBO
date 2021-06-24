#include "ros/ros.h"
#include "clear_map_service/GetMap.h"
#include "nav_msgs/GetMap.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "clear_map_service_client");

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<clear_map_service::GetMap>("clear_map_service");
  clear_map_service::GetMap srv;
  nav_msgs::OccupancyGrid newMap;

  ros::Publisher commandPub = n.advertise<nav_msgs::OccupancyGrid>("/new_map", 10);

  ros::Rate rate(1);
  ROS_INFO("Publishing new map to topic /new_map");
  while(ros::ok())
  {
    if (client.call(srv))
    {
      newMap = srv.response.map;
      ROS_INFO("I have got a map from server. Ready to publish");
      ROS_INFO("Publishing");
      commandPub.publish(newMap);
    }
    else
    {
      ROS_ERROR("Failed to call service");
      return 1;
    }

    ros::spinOnce();
    rate.sleep();
  }

  return 0;
}