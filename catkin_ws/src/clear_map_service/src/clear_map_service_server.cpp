#include "ros/ros.h"
#include <nav_msgs/GetMap.h>
#include "clear_map_service/GetMap.h"
#include "std_msgs/Header.h"
#include "geometry_msgs/Pose.h"

int rows;
int cols;
double mapResolution;
std_msgs::Header header;
geometry_msgs::Pose origin;
ros::Time map_load_time;
std::vector<std::vector<int> > grid;
std::vector<std::vector<int>> visitedElems;
int clusterType;
int aroundType;

void checkForMinCluster(int currRow, int currCol)
{
    std::vector<int> currElem = {currRow, currCol};
    visitedElems.push_back(currElem);

    if(visitedElems.size() < 4)
    {
        if(currRow - 1 > -1)           
        {
            if(grid[currRow-1][currCol] == clusterType)
            {
                std::vector<int> topElem = {currRow-1, currCol};

                if(std::find(visitedElems.begin(), visitedElems.end(), topElem) == visitedElems.end())
                {
                    checkForMinCluster(currRow-1, currCol);
                }                
            }
            else
            {
                aroundType = grid[currRow-1][currCol];
            }
                          
        }

        if(currCol + 1 < cols)           
        {
            if(grid[currRow][currCol + 1] == clusterType)
            {
                std::vector<int> rightElem = {currRow, currCol + 1};

                if(std::find(visitedElems.begin(), visitedElems.end(), rightElem) == visitedElems.end())
                {
                    checkForMinCluster(currRow, currCol + 1);
                }
            }
            else
            {
                aroundType = grid[currRow][currCol + 1];
            }
                          
        }

        if(currRow + 1 < rows)
        {
            if(grid[currRow + 1][currCol] == clusterType)
            {
                std::vector<int> bottomElem = {currRow + 1, currCol};

                if(std::find(visitedElems.begin(), visitedElems.end(), bottomElem) == visitedElems.end())
                {
                    checkForMinCluster(currRow + 1, currCol);
                }
            }
            else
            {
                aroundType = grid[currRow + 1][currCol];
            }
        }

        if(currCol - 1 > -1)
        {
            if(grid[currRow][currCol - 1] == clusterType)
            {
                std::vector<int> leftElem = {currRow, currCol - 1};

                if(std::find(visitedElems.begin(), visitedElems.end(), leftElem) == visitedElems.end())
                {
                    checkForMinCluster(currRow, currCol - 1);
                }
            }
            else
            {
                aroundType = grid[currRow][currCol - 1];
            }
        }
    }
      
}

void DeleteCluster()
{
    for(int i=0; i<visitedElems.size();  i++)
    {
        int row = visitedElems[i][0];
        int col = visitedElems[i][1];
        grid[row][col] = aroundType;
    }
}

nav_msgs::OccupancyGrid updateMap()
{   
    for(int i=0; i<rows; i++)
    {
        for(int j=0; j<cols; j++)
        {
            clusterType = grid[i][j];
            checkForMinCluster(i, j);

            if(visitedElems.size() < 4)
            {               
                DeleteCluster();
            }

            visitedElems.clear();
        }
    }

    int currCell = 0;

    nav_msgs::OccupancyGrid newMap;
    newMap.info.height = rows;
    newMap.info.width = cols;
    newMap.info.resolution = mapResolution;
    newMap.header = header;
    newMap.info.origin = origin;
    newMap.info.map_load_time = map_load_time;

    for(int i=0; i<rows; i++)
    {
        for(int j=0; j<cols; j++)
        {
            auto pos = newMap.data.begin() + currCell;
            newMap.data.insert(pos, grid[i][j]);
            currCell++;
        }
    }

    return newMap;
}

void readMap(const nav_msgs::OccupancyGrid& map)
{
    ROS_INFO("Received a %d X %d map @ %.3f m/px\n", map.info.width, map.info.height, map.info.resolution);

    rows = map.info.height;
    cols = map.info.width;
    mapResolution = map.info.resolution;
    header = map.header;
    origin = map.info.origin;
    map_load_time = map.info.map_load_time;

    grid.resize(rows); // Dynamically resize the grid
    for (int i=0; i<rows; i++) { grid[i].resize(cols); }

    int currCell = 0;
    for (int i=0; i<rows; i++) {
        for(int j=0; j<cols; j++) {
            grid[i][j] = map.data[currCell];
            currCell++;
        }
    }
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
        readMap(res.map);
        return true;
    }
    else {
        ROS_ERROR("Failed to call map service");
        return false;
    }
}

bool clearMap(clear_map_service::GetMap::Request &req,
              clear_map_service::GetMap::Response &res)
{
    ROS_INFO("Client requested a new map");
    ros::NodeHandle node;

    if (!requestMap(node))
        exit(-1);

    res.map = updateMap();
    ROS_INFO("Sending new map to client");

    return true;
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "clear_map_service_server");
    ros::NodeHandle node;

    ros::ServiceServer server = node.advertiseService("clear_map_service", clearMap);

    ROS_INFO("Waiting for request from client...");

    ros::spin();
    
}

