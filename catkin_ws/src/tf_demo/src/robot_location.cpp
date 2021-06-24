#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <vector>
#include <nav_msgs/GetMap.h>
#include <cmath>

nav_msgs::OccupancyGrid map;

std::vector<int> convertCoordsToMapIndexes(double x, double y)
{
	// grid_i = (map_y - map.info.origin.position.y) / map.info.resolution
	// grid_j = (map_x - map.info.origin.position.x) / map.info.resolution

	std::vector<int> currentIndexes(2);

	//i
	currentIndexes[0] = (int)((y - map.info.origin.position.y) / map.info.resolution);

	//j
	currentIndexes[1] = (int)((x - map.info.origin.position.x) / map.info.resolution);

	return currentIndexes;
}

std::vector<double> convertMapIndexesToCoords(int i, int j)
{
	// map_x = grid_j * map.info.resolution + map.info.origin.position.x
	// map_y = grid_i * map.info.resolution + map.info.origin.position.y
	
	std::vector<double> currentCoords(2);

	//x
	currentCoords[0] = j * map.info.resolution + map.info.origin.position.x;

	//y
	currentCoords[1] = i * map.info.resolution + map.info.origin.position.y;

	return currentCoords;
}

bool requestMap(ros::NodeHandle &nh)
{
    nav_msgs::GetMap::Request req;
    nav_msgs::GetMap::Response res;

    while (!ros::service::waitForService("static_map", ros::Duration(3.0))) {
         ROS_INFO("Waiting for service static_map to become available");
    }

    ROS_INFO("Requesting the map...");
    ros::ServiceClient mapClient = nh.serviceClient<nav_msgs::GetMap>("static_map");
 
    if (mapClient.call(req, res)) {
        map = res.map;
        return true;
    }
    else {
        ROS_ERROR("Failed to call map service");
        return false;
    }
}

int main(int argc, char** argv){
	ros::init(argc, argv, "robot_location");
	ros::NodeHandle node;
	
	if(requestMap(node))
	{
		tf::TransformListener listener;
		ros::Rate rate(2.0);
		listener.waitForTransform("/loaded_map", "/base_footprint", ros::Time(0), ros::Duration(10.0));
		while (ros::ok())
		{
			tf::StampedTransform transform;
			try 
			{
				listener.lookupTransform("/loaded_map", "/base_footprint", ros::Time(0), transform);
				double x = transform.getOrigin().x();
				double y = transform.getOrigin().y();
				std::cout << "Current position from tf: (" << x << "," << y << "); ";

				std::vector<int> coordsInIndexes = convertCoordsToMapIndexes(x, y);
				std::cout<< "Current indexes from current position:[" << coordsInIndexes[0] << ", " << coordsInIndexes[1] << "]; ";
				
				std::vector<double> indexesInCoords = convertMapIndexesToCoords(coordsInIndexes[0], coordsInIndexes[1]);
				std::cout<< "Current position from current indexes:(" << indexesInCoords[0] << ", " << indexesInCoords[1] << ");" << std::endl;
			} 	
			catch (tf::TransformException &ex) 
			{
				ROS_ERROR("%s",ex.what());
			}
			rate.sleep();
		}
	}
	else
	{
		ROS_ERROR("Failed to call map service");

	}
	
    return 0;
}
