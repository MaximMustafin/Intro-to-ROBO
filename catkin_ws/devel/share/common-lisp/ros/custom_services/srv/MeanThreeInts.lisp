; Auto-generated. Do not edit!


(cl:in-package custom_services-srv)


;//! \htmlinclude MeanThreeInts-request.msg.html

(cl:defclass <MeanThreeInts-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:integer
    :initform 0)
   (c
    :reader c
    :initarg :c
    :type cl:integer
    :initform 0))
)

(cl:defclass MeanThreeInts-request (<MeanThreeInts-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MeanThreeInts-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MeanThreeInts-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_services-srv:<MeanThreeInts-request> is deprecated: use custom_services-srv:MeanThreeInts-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <MeanThreeInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_services-srv:a-val is deprecated.  Use custom_services-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <MeanThreeInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_services-srv:b-val is deprecated.  Use custom_services-srv:b instead.")
  (b m))

(cl:ensure-generic-function 'c-val :lambda-list '(m))
(cl:defmethod c-val ((m <MeanThreeInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_services-srv:c-val is deprecated.  Use custom_services-srv:c instead.")
  (c m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MeanThreeInts-request>) ostream)
  "Serializes a message object of type '<MeanThreeInts-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'c)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MeanThreeInts-request>) istream)
  "Deserializes a message object of type '<MeanThreeInts-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'c) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MeanThreeInts-request>)))
  "Returns string type for a service object of type '<MeanThreeInts-request>"
  "custom_services/MeanThreeIntsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MeanThreeInts-request)))
  "Returns string type for a service object of type 'MeanThreeInts-request"
  "custom_services/MeanThreeIntsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MeanThreeInts-request>)))
  "Returns md5sum for a message object of type '<MeanThreeInts-request>"
  "f30a58e2837f4b803e4927983e2be21f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MeanThreeInts-request)))
  "Returns md5sum for a message object of type 'MeanThreeInts-request"
  "f30a58e2837f4b803e4927983e2be21f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MeanThreeInts-request>)))
  "Returns full string definition for message of type '<MeanThreeInts-request>"
  (cl:format cl:nil "int64 a~%int64 b~%int64 c~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MeanThreeInts-request)))
  "Returns full string definition for message of type 'MeanThreeInts-request"
  (cl:format cl:nil "int64 a~%int64 b~%int64 c~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MeanThreeInts-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MeanThreeInts-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MeanThreeInts-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
    (cl:cons ':c (c msg))
))
;//! \htmlinclude MeanThreeInts-response.msg.html

(cl:defclass <MeanThreeInts-response> (roslisp-msg-protocol:ros-message)
  ((mean
    :reader mean
    :initarg :mean
    :type cl:float
    :initform 0.0))
)

(cl:defclass MeanThreeInts-response (<MeanThreeInts-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MeanThreeInts-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MeanThreeInts-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_services-srv:<MeanThreeInts-response> is deprecated: use custom_services-srv:MeanThreeInts-response instead.")))

(cl:ensure-generic-function 'mean-val :lambda-list '(m))
(cl:defmethod mean-val ((m <MeanThreeInts-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_services-srv:mean-val is deprecated.  Use custom_services-srv:mean instead.")
  (mean m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MeanThreeInts-response>) ostream)
  "Serializes a message object of type '<MeanThreeInts-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mean))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MeanThreeInts-response>) istream)
  "Deserializes a message object of type '<MeanThreeInts-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mean) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MeanThreeInts-response>)))
  "Returns string type for a service object of type '<MeanThreeInts-response>"
  "custom_services/MeanThreeIntsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MeanThreeInts-response)))
  "Returns string type for a service object of type 'MeanThreeInts-response"
  "custom_services/MeanThreeIntsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MeanThreeInts-response>)))
  "Returns md5sum for a message object of type '<MeanThreeInts-response>"
  "f30a58e2837f4b803e4927983e2be21f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MeanThreeInts-response)))
  "Returns md5sum for a message object of type 'MeanThreeInts-response"
  "f30a58e2837f4b803e4927983e2be21f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MeanThreeInts-response>)))
  "Returns full string definition for message of type '<MeanThreeInts-response>"
  (cl:format cl:nil "float64 mean~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MeanThreeInts-response)))
  "Returns full string definition for message of type 'MeanThreeInts-response"
  (cl:format cl:nil "float64 mean~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MeanThreeInts-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MeanThreeInts-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MeanThreeInts-response
    (cl:cons ':mean (mean msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MeanThreeInts)))
  'MeanThreeInts-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MeanThreeInts)))
  'MeanThreeInts-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MeanThreeInts)))
  "Returns string type for a service object of type '<MeanThreeInts>"
  "custom_services/MeanThreeInts")