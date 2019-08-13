; Auto-generated. Do not edit!


(cl:in-package dji_sdk-msg)


;//! \htmlinclude HotpointMission.msg.html

(cl:defclass <HotpointMission> (roslisp-msg-protocol:ros-message)
  ((missionIndex
    :reader missionIndex
    :initarg :missionIndex
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (hotpoint
    :reader hotpoint
    :initarg :hotpoint
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (startHotPoint
    :reader startHotPoint
    :initarg :startHotPoint
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (headingMode
    :reader headingMode
    :initarg :headingMode
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (altitude
    :reader altitude
    :initarg :altitude
    :type std_msgs-msg:UInt16
    :initform (cl:make-instance 'std_msgs-msg:UInt16))
   (angleVel
    :reader angleVel
    :initarg :angleVel
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (radius
    :reader radius
    :initarg :radius
    :type std_msgs-msg:UInt16
    :initform (cl:make-instance 'std_msgs-msg:UInt16))
   (gimbalAngle
    :reader gimbalAngle
    :initarg :gimbalAngle
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16))
   (clockwise
    :reader clockwise
    :initarg :clockwise
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (isUseCam
    :reader isUseCam
    :initarg :isUseCam
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (sor
    :reader sor
    :initarg :sor
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (shootVel
    :reader shootVel
    :initarg :shootVel
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8)))
)

(cl:defclass HotpointMission (<HotpointMission>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HotpointMission>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HotpointMission)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dji_sdk-msg:<HotpointMission> is deprecated: use dji_sdk-msg:HotpointMission instead.")))

(cl:ensure-generic-function 'missionIndex-val :lambda-list '(m))
(cl:defmethod missionIndex-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:missionIndex-val is deprecated.  Use dji_sdk-msg:missionIndex instead.")
  (missionIndex m))

(cl:ensure-generic-function 'hotpoint-val :lambda-list '(m))
(cl:defmethod hotpoint-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:hotpoint-val is deprecated.  Use dji_sdk-msg:hotpoint instead.")
  (hotpoint m))

(cl:ensure-generic-function 'startHotPoint-val :lambda-list '(m))
(cl:defmethod startHotPoint-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:startHotPoint-val is deprecated.  Use dji_sdk-msg:startHotPoint instead.")
  (startHotPoint m))

(cl:ensure-generic-function 'headingMode-val :lambda-list '(m))
(cl:defmethod headingMode-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:headingMode-val is deprecated.  Use dji_sdk-msg:headingMode instead.")
  (headingMode m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:altitude-val is deprecated.  Use dji_sdk-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'angleVel-val :lambda-list '(m))
(cl:defmethod angleVel-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:angleVel-val is deprecated.  Use dji_sdk-msg:angleVel instead.")
  (angleVel m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:radius-val is deprecated.  Use dji_sdk-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'gimbalAngle-val :lambda-list '(m))
(cl:defmethod gimbalAngle-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:gimbalAngle-val is deprecated.  Use dji_sdk-msg:gimbalAngle instead.")
  (gimbalAngle m))

(cl:ensure-generic-function 'clockwise-val :lambda-list '(m))
(cl:defmethod clockwise-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:clockwise-val is deprecated.  Use dji_sdk-msg:clockwise instead.")
  (clockwise m))

(cl:ensure-generic-function 'isUseCam-val :lambda-list '(m))
(cl:defmethod isUseCam-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:isUseCam-val is deprecated.  Use dji_sdk-msg:isUseCam instead.")
  (isUseCam m))

(cl:ensure-generic-function 'sor-val :lambda-list '(m))
(cl:defmethod sor-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:sor-val is deprecated.  Use dji_sdk-msg:sor instead.")
  (sor m))

(cl:ensure-generic-function 'shootVel-val :lambda-list '(m))
(cl:defmethod shootVel-val ((m <HotpointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:shootVel-val is deprecated.  Use dji_sdk-msg:shootVel instead.")
  (shootVel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HotpointMission>) ostream)
  "Serializes a message object of type '<HotpointMission>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'missionIndex) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'hotpoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'startHotPoint) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'headingMode) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'altitude) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angleVel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'radius) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gimbalAngle) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'clockwise) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'isUseCam) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sor) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'shootVel) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HotpointMission>) istream)
  "Deserializes a message object of type '<HotpointMission>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'missionIndex) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'hotpoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'startHotPoint) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'headingMode) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'altitude) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angleVel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'radius) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gimbalAngle) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'clockwise) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'isUseCam) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sor) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'shootVel) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HotpointMission>)))
  "Returns string type for a message object of type '<HotpointMission>"
  "dji_sdk/HotpointMission")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HotpointMission)))
  "Returns string type for a message object of type 'HotpointMission"
  "dji_sdk/HotpointMission")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HotpointMission>)))
  "Returns md5sum for a message object of type '<HotpointMission>"
  "1275f1566cde5c929e0caa2875c0e3c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HotpointMission)))
  "Returns md5sum for a message object of type 'HotpointMission"
  "1275f1566cde5c929e0caa2875c0e3c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HotpointMission>)))
  "Returns full string definition for message of type '<HotpointMission>"
  (cl:format cl:nil "std_msgs/UInt8 missionIndex~%geometry_msgs/Point hotpoint~%std_msgs/UInt8 startHotPoint~%std_msgs/UInt8 headingMode~%std_msgs/UInt16 altitude~%std_msgs/UInt8 angleVel~%std_msgs/UInt16 radius~%std_msgs/Int16 gimbalAngle~%std_msgs/UInt8 clockwise~%std_msgs/UInt8 isUseCam~%std_msgs/UInt8 sor~%std_msgs/UInt8 shootVel~%~%================================================================================~%MSG: std_msgs/UInt8~%uint8 data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/UInt16~%uint16 data~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HotpointMission)))
  "Returns full string definition for message of type 'HotpointMission"
  (cl:format cl:nil "std_msgs/UInt8 missionIndex~%geometry_msgs/Point hotpoint~%std_msgs/UInt8 startHotPoint~%std_msgs/UInt8 headingMode~%std_msgs/UInt16 altitude~%std_msgs/UInt8 angleVel~%std_msgs/UInt16 radius~%std_msgs/Int16 gimbalAngle~%std_msgs/UInt8 clockwise~%std_msgs/UInt8 isUseCam~%std_msgs/UInt8 sor~%std_msgs/UInt8 shootVel~%~%================================================================================~%MSG: std_msgs/UInt8~%uint8 data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/UInt16~%uint16 data~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HotpointMission>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'missionIndex))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'hotpoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'startHotPoint))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'headingMode))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'altitude))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angleVel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'radius))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gimbalAngle))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'clockwise))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'isUseCam))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sor))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'shootVel))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HotpointMission>))
  "Converts a ROS message object to a list"
  (cl:list 'HotpointMission
    (cl:cons ':missionIndex (missionIndex msg))
    (cl:cons ':hotpoint (hotpoint msg))
    (cl:cons ':startHotPoint (startHotPoint msg))
    (cl:cons ':headingMode (headingMode msg))
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':angleVel (angleVel msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':gimbalAngle (gimbalAngle msg))
    (cl:cons ':clockwise (clockwise msg))
    (cl:cons ':isUseCam (isUseCam msg))
    (cl:cons ':sor (sor msg))
    (cl:cons ':shootVel (shootVel msg))
))
