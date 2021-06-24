;; Auto-generated. Do not edit!


(when (boundp 'custom_messages::RobotStatus)
  (if (not (find-package "CUSTOM_MESSAGES"))
    (make-package "CUSTOM_MESSAGES"))
  (shadow 'RobotStatus (find-package "CUSTOM_MESSAGES")))
(unless (find-package "CUSTOM_MESSAGES::ROBOTSTATUS")
  (make-package "CUSTOM_MESSAGES::ROBOTSTATUS"))

(in-package "ROS")
;;//! \htmlinclude RobotStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass custom_messages::RobotStatus
  :super ros::object
  :slots (_header _robot_id _is_ready ))

(defmethod custom_messages::RobotStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:robot_id __robot_id) 0)
    ((:is_ready __is_ready) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _robot_id (round __robot_id))
   (setq _is_ready __is_ready)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:robot_id
   (&optional __robot_id)
   (if __robot_id (setq _robot_id __robot_id)) _robot_id)
  (:is_ready
   (&optional (__is_ready :null))
   (if (not (eq __is_ready :null)) (setq _is_ready __is_ready)) _is_ready)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _robot_id
    4
    ;; bool _is_ready
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _robot_id
       (write-long _robot_id s)
     ;; bool _is_ready
       (if _is_ready (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _robot_id
     (setq _robot_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _is_ready
     (setq _is_ready (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get custom_messages::RobotStatus :md5sum-) "fd4a4a969111c2fb5d233f5f91bb2733")
(setf (get custom_messages::RobotStatus :datatype-) "custom_messages/RobotStatus")
(setf (get custom_messages::RobotStatus :definition-)
      "Header header
int32 robot_id
bool is_ready
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

")



(provide :custom_messages/RobotStatus "fd4a4a969111c2fb5d233f5f91bb2733")


