#include <chrono>
#include <memory>
#include <ctime> 

#include "rclcpp/rclcpp.hpp"
#include "custom_interfaces/msg/str_num.hpp"     // CHANGE

using namespace std::chrono_literals;

/* This example creates a subclass of Node and uses std::bind() to register a
 * member function as a callback from the timer. */

class MinimalPublisher : public rclcpp::Node
{
public:
  MinimalPublisher()
  : Node("date_and_time_publisher"), count_(0)
  {
    publisher_ = this->create_publisher<custom_interfaces::msg::StrNum>("date_and_time", 10);
    timer_ = this->create_wall_timer(
      1000ms, std::bind(&MinimalPublisher::timer_callback, this));
  }

private:
  void timer_callback()
  {
    auto message = custom_interfaces::msg::StrNum(); 
    std::time_t current_time = std::time(NULL);
    char date_and_time[100];
    strftime(date_and_time, 100, "%H:%M:%S -- %d/%m/%Y", std::localtime(&current_time));
    message.str = date_and_time;
    //RCLCPP_INFO(this->get_logger(), message.str.c_str());
    publisher_->publish(message);
    ++count_;
  }
  rclcpp::TimerBase::SharedPtr timer_;
  rclcpp::Publisher<custom_interfaces::msg::StrNum>::SharedPtr publisher_;
  size_t count_;
};

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MinimalPublisher>());
  rclcpp::shutdown();
  return 0;
}
