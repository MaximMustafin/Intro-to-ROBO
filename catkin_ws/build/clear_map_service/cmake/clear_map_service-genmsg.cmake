# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "clear_map_service: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(clear_map_service_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv" NAME_WE)
add_custom_target(_clear_map_service_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "clear_map_service" "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv" "geometry_msgs/Point:geometry_msgs/Quaternion:nav_msgs/MapMetaData:geometry_msgs/Pose:std_msgs/Header:nav_msgs/OccupancyGrid"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(clear_map_service
  "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/OccupancyGrid.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/clear_map_service
)

### Generating Module File
_generate_module_cpp(clear_map_service
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/clear_map_service
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(clear_map_service_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(clear_map_service_generate_messages clear_map_service_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv" NAME_WE)
add_dependencies(clear_map_service_generate_messages_cpp _clear_map_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(clear_map_service_gencpp)
add_dependencies(clear_map_service_gencpp clear_map_service_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS clear_map_service_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(clear_map_service
  "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/OccupancyGrid.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/clear_map_service
)

### Generating Module File
_generate_module_eus(clear_map_service
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/clear_map_service
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(clear_map_service_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(clear_map_service_generate_messages clear_map_service_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv" NAME_WE)
add_dependencies(clear_map_service_generate_messages_eus _clear_map_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(clear_map_service_geneus)
add_dependencies(clear_map_service_geneus clear_map_service_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS clear_map_service_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(clear_map_service
  "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/OccupancyGrid.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/clear_map_service
)

### Generating Module File
_generate_module_lisp(clear_map_service
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/clear_map_service
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(clear_map_service_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(clear_map_service_generate_messages clear_map_service_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv" NAME_WE)
add_dependencies(clear_map_service_generate_messages_lisp _clear_map_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(clear_map_service_genlisp)
add_dependencies(clear_map_service_genlisp clear_map_service_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS clear_map_service_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(clear_map_service
  "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/OccupancyGrid.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/clear_map_service
)

### Generating Module File
_generate_module_nodejs(clear_map_service
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/clear_map_service
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(clear_map_service_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(clear_map_service_generate_messages clear_map_service_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv" NAME_WE)
add_dependencies(clear_map_service_generate_messages_nodejs _clear_map_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(clear_map_service_gennodejs)
add_dependencies(clear_map_service_gennodejs clear_map_service_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS clear_map_service_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(clear_map_service
  "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/OccupancyGrid.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/clear_map_service
)

### Generating Module File
_generate_module_py(clear_map_service
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/clear_map_service
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(clear_map_service_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(clear_map_service_generate_messages clear_map_service_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/maksim/catkin_ws/src/clear_map_service/srv/GetMap.srv" NAME_WE)
add_dependencies(clear_map_service_generate_messages_py _clear_map_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(clear_map_service_genpy)
add_dependencies(clear_map_service_genpy clear_map_service_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS clear_map_service_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/clear_map_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/clear_map_service
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(clear_map_service_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(clear_map_service_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/clear_map_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/clear_map_service
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(clear_map_service_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(clear_map_service_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/clear_map_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/clear_map_service
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(clear_map_service_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(clear_map_service_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/clear_map_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/clear_map_service
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(clear_map_service_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(clear_map_service_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/clear_map_service)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/clear_map_service\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/clear_map_service
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(clear_map_service_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(clear_map_service_generate_messages_py nav_msgs_generate_messages_py)
endif()
