#ifndef WALKER2_H
#define WALKER2_H

#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
#include "gazebo_msgs/GetModelState.h"
#include <algorithm>
#include <vector>

class Walker2 {
public:
  static constexpr double FORWARD_SPEED = 0.1;
  static constexpr double ANGULAR_SPEED = 0.3;
  static constexpr double MIN_SCAN_ANGLE = M_PI+(-10.0/180*M_PI);
  static constexpr double MAX_SCAN_ANGLE = M_PI+(+10.0/180*M_PI);
  static constexpr float MIN_DIST_FROM_OBSTACLE = 0.5f;
  double ROTATE_ANGLE = -1;
  double yaw_z = 3.14;
  
  Walker2();
  void startMoving();
  
private:
  ros::NodeHandle node;
  ros::Publisher commandPub;
  ros::Subscriber laserSub; 
  ros::ServiceClient client;
  bool keepMoving;
  bool isRotated = false;

  void scanCallback(const sensor_msgs::LaserScan::ConstPtr&);
  void setYaw_Z();
  void moveForward();
};

#endif // WALKER2_H