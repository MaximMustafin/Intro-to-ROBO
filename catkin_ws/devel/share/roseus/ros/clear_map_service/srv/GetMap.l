;; Auto-generated. Do not edit!


(when (boundp 'clear_map_service::GetMap)
  (if (not (find-package "CLEAR_MAP_SERVICE"))
    (make-package "CLEAR_MAP_SERVICE"))
  (shadow 'GetMap (find-package "CLEAR_MAP_SERVICE")))
(unless (find-package "CLEAR_MAP_SERVICE::GETMAP")
  (make-package "CLEAR_MAP_SERVICE::GETMAP"))
(unless (find-package "CLEAR_MAP_SERVICE::GETMAPREQUEST")
  (make-package "CLEAR_MAP_SERVICE::GETMAPREQUEST"))
(unless (find-package "CLEAR_MAP_SERVICE::GETMAPRESPONSE")
  (make-package "CLEAR_MAP_SERVICE::GETMAPRESPONSE"))

(in-package "ROS")



(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass clear_map_service::GetMapRequest
  :super ros::object
  :slots ())

(defmethod clear_map_service::GetMapRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass clear_map_service::GetMapResponse
  :super ros::object
  :slots (_map ))

(defmethod clear_map_service::GetMapResponse
  (:init
   (&key
    ((:map __map) (instance nav_msgs::OccupancyGrid :init))
    )
   (send-super :init)
   (setq _map __map)
   self)
  (:map
   (&rest __map)
   (if (keywordp (car __map))
       (send* _map __map)
     (progn
       (if __map (setq _map (car __map)))
       _map)))
  (:serialization-length
   ()
   (+
    ;; nav_msgs/OccupancyGrid _map
    (send _map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/OccupancyGrid _map
       (send _map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/OccupancyGrid _map
     (send _map :deserialize buf ptr-) (incf ptr- (send _map :serialization-length))
   ;;
   self)
  )

(defclass clear_map_service::GetMap
  :super ros::object
  :slots ())

(setf (get clear_map_service::GetMap :md5sum-) "6cdd0a18e0aff5b0a3ca2326a89b54ff")
(setf (get clear_map_service::GetMap :datatype-) "clear_map_service/GetMap")
(setf (get clear_map_service::GetMap :request) clear_map_service::GetMapRequest)
(setf (get clear_map_service::GetMap :response) clear_map_service::GetMapResponse)

(defmethod clear_map_service::GetMapRequest
  (:response () (instance clear_map_service::GetMapResponse :init)))

(setf (get clear_map_service::GetMapRequest :md5sum-) "6cdd0a18e0aff5b0a3ca2326a89b54ff")
(setf (get clear_map_service::GetMapRequest :datatype-) "clear_map_service/GetMapRequest")
(setf (get clear_map_service::GetMapRequest :definition-)
      "# Get the map as a nav_msgs/OccupancyGrid
---
nav_msgs/OccupancyGrid map


================================================================================
MSG: nav_msgs/OccupancyGrid
# This represents a 2-D grid map, in which each cell represents the probability of
# occupancy.

Header header 

#MetaData for the map
MapMetaData info

# The map data, in row-major order, starting with (0,0).  Occupancy
# probabilities are in the range [0,100].  Unknown is -1.
int8[] data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get clear_map_service::GetMapResponse :md5sum-) "6cdd0a18e0aff5b0a3ca2326a89b54ff")
(setf (get clear_map_service::GetMapResponse :datatype-) "clear_map_service/GetMapResponse")
(setf (get clear_map_service::GetMapResponse :definition-)
      "# Get the map as a nav_msgs/OccupancyGrid
---
nav_msgs/OccupancyGrid map


================================================================================
MSG: nav_msgs/OccupancyGrid
# This represents a 2-D grid map, in which each cell represents the probability of
# occupancy.

Header header 

#MetaData for the map
MapMetaData info

# The map data, in row-major order, starting with (0,0).  Occupancy
# probabilities are in the range [0,100].  Unknown is -1.
int8[] data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :clear_map_service/GetMap "6cdd0a18e0aff5b0a3ca2326a89b54ff")


