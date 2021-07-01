// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from custom_interfaces:msg/StrNum.idl
// generated code does not contain a copyright notice

#ifndef CUSTOM_INTERFACES__MSG__DETAIL__STR_NUM__BUILDER_HPP_
#define CUSTOM_INTERFACES__MSG__DETAIL__STR_NUM__BUILDER_HPP_

#include "custom_interfaces/msg/detail/str_num__struct.hpp"
#include <rosidl_runtime_cpp/message_initialization.hpp>
#include <algorithm>
#include <utility>


namespace custom_interfaces
{

namespace msg
{

namespace builder
{

class Init_StrNum_num
{
public:
  explicit Init_StrNum_num(::custom_interfaces::msg::StrNum & msg)
  : msg_(msg)
  {}
  ::custom_interfaces::msg::StrNum num(::custom_interfaces::msg::StrNum::_num_type arg)
  {
    msg_.num = std::move(arg);
    return std::move(msg_);
  }

private:
  ::custom_interfaces::msg::StrNum msg_;
};

class Init_StrNum_str
{
public:
  Init_StrNum_str()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_StrNum_num str(::custom_interfaces::msg::StrNum::_str_type arg)
  {
    msg_.str = std::move(arg);
    return Init_StrNum_num(msg_);
  }

private:
  ::custom_interfaces::msg::StrNum msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::custom_interfaces::msg::StrNum>()
{
  return custom_interfaces::msg::builder::Init_StrNum_str();
}

}  // namespace custom_interfaces

#endif  // CUSTOM_INTERFACES__MSG__DETAIL__STR_NUM__BUILDER_HPP_
