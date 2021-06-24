#include <ros/ros.h>
#include <nav_msgs/GetMap.h>
#include <vector>
#include <fstream>
#include <algorithm>
#include <string>

//ros::Publisher commandPub;

// grid map
int rows;
int cols;
double mapResolution;
std::vector<std::vector<bool>> grid; 

bool clusterType;
std::vector<std::vector<int>> visitedElems;

void checkForMinCluster(int currRow, int currCol)
{
    std::vector<int> currElem = {currRow, currCol};
    visitedElems.push_back(currElem);

    if(visitedElems.size() < 5)
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
        }
    }
      
}

void DeleteCluster()
{
    for(int i=0; i<visitedElems.size();  i++)
    {
        int row = visitedElems[i][0];
        int col = visitedElems[i][1];
        grid[row][col] = !clusterType;
    }
}

bool updateMap()
{   
    for(int i=0; i<rows; i++)
    {
        for(int j=0; j<cols; j++)
        {
            clusterType = grid[i][j];
            checkForMinCluster(i, j);

            if(visitedElems.size() < 5)
            {               
                DeleteCluster();
            }

            visitedElems.clear();
        }
    }

    // int currCell = 0;

    // nav_msgs::OccupancyGrid newMap;
    // newMap.info.height = rows;
    // newMap.info.width = cols;
    // newMap.info.resolution = mapResolution;

    // for(int i=0; i<rows; i++)
    // {
    //     for(int j=0; j<cols; i++)
    //     {
    //         if(grid[i][j])
    //         {
    //            newMap.data[currCell] = 1;
    //         }
    //         else
    //         {
    //             newMap.data[currCell] = 0;
    //         }
    //         currCell++;
    //     }
    // }


    return true;
}

void readMap(const nav_msgs::OccupancyGrid& map)
{
    ROS_INFO("Received a %d X %d map @ %.3f m/px\n", map.info.width, map.info.height, map.info.resolution);

    rows = map.info.height;
    cols = map.info.width;
    mapResolution = map.info.resolution;

    grid.resize(rows); // Dynamically resize the grid
    for (int i=0; i<rows; i++) { grid[i].resize(cols); }

    int currCell = 0;
    for (int i=0; i<rows; i++) {
        for(int j=0; j<cols; j++) {
            if (map.data[currCell] == 0) // unoccupied cell
                grid[i][j] = false;
            else
                grid[i][j] = true; //occupied (100) or unknown cell (-1)
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

void printGridToFile(std::string fileName) {
    std::cout<<"Print info to file "<< fileName<<std::endl;
    std::ofstream gridFile;
    gridFile.open(fileName);
  
    for (int i = grid.size() - 1; i >= 0; i--) {        
        for (int j = 0; j < grid[i].size(); j++) {
        gridFile << (grid[i][j] ? "1" : "0");           
        }
        gridFile << std::endl;
    }
    gridFile.close();
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "update_map");
    ros::NodeHandle nh;

    //commandPub = nh.advertise<nav_msgs::OccupancyGrid>("/map", 10);

    if (!requestMap(nh))
        exit(-1);


    updateMap();

    printGridToFile("updated_map.txt");

    

    return 0;
}
