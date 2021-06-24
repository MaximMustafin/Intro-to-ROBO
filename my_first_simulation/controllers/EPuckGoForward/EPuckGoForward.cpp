#include <webots/Robot.hpp>
#include <webots/Motor.hpp>

using namespace webots;

int main(int argc, char **argv) {
  Robot *robot = new Robot();
 
  double max_speed = 6.28;
  int timestep = 16;
 
  Motor *leftMotor = robot->getMotor("left wheel motor");
  Motor *rightMotor = robot->getMotor("right wheel motor");
 
  leftMotor->setPosition(INFINITY);
  leftMotor->setVelocity(0.0);
 
  rightMotor->setPosition(INFINITY);
  rightMotor->setVelocity(0.0);
 
  double wheel_radius = 0.025;
  double distance_between_wheels = 0.090;
 
  double length_side = 0.30;
  
  double linear_velocity = max_speed * wheel_radius;
  double duration_side= length_side/linear_velocity;
 
  double start_time = robot->getTime();
 
  double rotation_angle = 1.570796327;//90 degrees
  
  double rate_of_rotation = (2*linear_velocity)/distance_between_wheels;

  double duration_turn = rotation_angle/rate_of_rotation;
 
  double rotate_time_start = start_time + duration_side;
  double rotate_time_end = rotate_time_start + duration_turn;
 
  bool flag = false;
 
  while (robot->step(timestep) != -1)
  { 
     double current_time = robot->getTime();
     
     double left_speed = max_speed;
     double right_speed = max_speed;
     
     if(rotate_time_start < current_time && current_time < rotate_time_end)   
     {
       left_speed = (-1)*max_speed;
       right_speed = max_speed;
       flag = false;
     }
     else
     {
       if(current_time > rotate_time_end && !flag)
       {
         rotate_time_start = current_time + duration_side;
         rotate_time_end = rotate_time_start + duration_turn;
         flag = true;
       }
       
     }
     
     leftMotor->setVelocity(left_speed);
     rightMotor->setVelocity(right_speed);

    
 };

 delete robot;

 return 0;
}