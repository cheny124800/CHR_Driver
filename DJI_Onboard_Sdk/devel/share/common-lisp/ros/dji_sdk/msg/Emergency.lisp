; Auto-generated. Do not edit!


(cl:in-package dji_sdk-msg)


;//! \htmlinclude Emergency.msg.html

(cl:defclass <Emergency> (roslisp-msg-protocol:ros-message)
  ((home
    :reader home
    :initarg :home
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (land
    :reader land
    :initarg :land
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (hover
    :reader hover
    :initarg :hover
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (takeOff
    :reader takeOff
    :initarg :takeOff
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8)))
)

(cl:defclass Emergency (<Emergency>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Emergency>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Emergency)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dji_sdk-msg:<Emergency> is deprecated: use dji_sdk-msg:Emergency instead.")))

(cl:ensure-generic-function 'home-val :lambda-list '(m))
(cl:defmethod home-val ((m <Emergency>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:home-val is deprecated.  Use dji_sdk-msg:home instead.")
  (home m))

(cl:ensure-generic-function 'land-val :lambda-list '(m))
(cl:defmethod land-val ((m <Emergency>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:land-val is deprecated.  Use dji_sdk-msg:land instead.")
  (land m))

(cl:ensure-generic-function 'hover-val :lambda-list '(m))
(cl:defmethod hover-val ((m <Emergency>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:hover-val is deprecated.  Use dji_sdk-msg:hover instead.")
  (hover m))

(cl:ensure-generic-function 'takeOff-val :lambda-list '(m))
(cl:defmethod takeOff-val ((m <Emergency>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:takeOff-val is deprecated.  Use dji_sdk-msg:takeOff instead.")
  (takeOff m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Emergency>) ostream)
  "Serializes a message object of type '<Emergency>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'home) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'land) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'hover) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'takeOff) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Emergency>) istream)
  "Deserializes a message object of type '<Emergency>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'home) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'land) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'hover) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'takeOff) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Emergency>)))
  "Returns string type for a message object of type '<Emergency>"
  "dji_sdk/Emergency")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Emergency)))
  "Returns string type for a message object of type 'Emergency"
  "dji_sdk/Emergency")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Emergency>)))
  "Returns md5sum for a message object of type '<Emergency>"
  "1d411b8cc595547a01bef8995efbdc30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Emergency)))
  "Returns md5sum for a message object of type 'Emergency"
  "1d411b8cc595547a01bef8995efbdc30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Emergency>)))
  "Returns full string definition for message of type '<Emergency>"
  (cl:format cl:nil "std_msgs/UInt8 home~%std_msgs/UInt8 land~%std_msgs/UInt8 hover~%std_msgs/UInt8 takeOff~%~%================================================================================~%MSG: std_msgs/UInt8~%uint8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Emergency)))
  "Returns full string definition for message of type 'Emergency"
  (cl:format cl:nil "std_msgs/UInt8 home~%std_msgs/UInt8 land~%std_msgs/UInt8 hover~%std_msgs/UInt8 takeOff~%~%================================================================================~%MSG: std_msgs/UInt8~%uint8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Emergency>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'home))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'land))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'hover))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'takeOff))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Emergency>))
  "Converts a ROS message object to a list"
  (cl:list 'Emergency
    (cl:cons ':home (home msg))
    (cl:cons ':land (land msg))
    (cl:cons ':hover (hover msg))
    (cl:cons ':takeOff (takeOff msg))
))
