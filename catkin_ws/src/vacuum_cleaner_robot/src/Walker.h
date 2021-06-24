#ifndef WALKER_H
#define WALKER_H

#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"

class Walker {
public:
  static constexpr double FORWARD_SPEED = 0.2;
  static constexpr double ANGULAR_SPEED = 0.8;
  static constexpr double MIN_SCAN_ANGLE = M_PI+(-15.0/180*M_PI);
  static constexpr double MAX_SCAN_ANGLE = M_PI+(+15.0/180*M_PI);
  static constexpr float MIN_DIST_FROM_OBSTACLE = 0.5f;
  Walker();
  void startMoving();

private:
  ros::NodeHandle node;
  ros::Publisher commandPub;
  ros::Subscriber laserSub;
  bool keepMoving;

  void moveForward();
  void scanCallback(const sensor_msgs::LaserScan::ConstPtr&);
};

#endif // WALKER_H