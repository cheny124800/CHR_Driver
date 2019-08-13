; Auto-generated. Do not edit!


(cl:in-package dji_sdk-msg)


;//! \htmlinclude WaypointMission.msg.html

(cl:defclass <WaypointMission> (roslisp-msg-protocol:ros-message)
  ((missionIndex
    :reader missionIndex
    :initarg :missionIndex
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (latLntCount
    :reader latLntCount
    :initarg :latLntCount
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (latLntList
    :reader latLntList
    :initarg :latLntList
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (actionCount
    :reader actionCount
    :initarg :actionCount
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (waypointAction
    :reader waypointAction
    :initarg :waypointAction
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (altitude
    :reader altitude
    :initarg :altitude
    :type std_msgs-msg:UInt16
    :initform (cl:make-instance 'std_msgs-msg:UInt16))
   (velocity
    :reader velocity
    :initarg :velocity
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (finishAction
    :reader finishAction
    :initarg :finishAction
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (headingMode
    :reader headingMode
    :initarg :headingMode
    :type std_msgs-msg:UInt8
    :initform (cl:make-instance 'std_msgs-msg:UInt8))
   (gimbalAngle
    :reader gimbalAngle
    :initarg :gimbalAngle
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16))
   (repeatTimes
    :reader repeatTimes
    :initarg :repeatTimes
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

(cl:defclass WaypointMission (<WaypointMission>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaypointMission>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaypointMission)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dji_sdk-msg:<WaypointMission> is deprecated: use dji_sdk-msg:WaypointMission instead.")))

(cl:ensure-generic-function 'missionIndex-val :lambda-list '(m))
(cl:defmethod missionIndex-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:missionIndex-val is deprecated.  Use dji_sdk-msg:missionIndex instead.")
  (missionIndex m))

(cl:ensure-generic-function 'latLntCount-val :lambda-list '(m))
(cl:defmethod latLntCount-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:latLntCount-val is deprecated.  Use dji_sdk-msg:latLntCount instead.")
  (latLntCount m))

(cl:ensure-generic-function 'latLntList-val :lambda-list '(m))
(cl:defmethod latLntList-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:latLntList-val is deprecated.  Use dji_sdk-msg:latLntList instead.")
  (latLntList m))

(cl:ensure-generic-function 'actionCount-val :lambda-list '(m))
(cl:defmethod actionCount-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:actionCount-val is deprecated.  Use dji_sdk-msg:actionCount instead.")
  (actionCount m))

(cl:ensure-generic-function 'waypointAction-val :lambda-list '(m))
(cl:defmethod waypointAction-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:waypointAction-val is deprecated.  Use dji_sdk-msg:waypointAction instead.")
  (waypointAction m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:altitude-val is deprecated.  Use dji_sdk-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:velocity-val is deprecated.  Use dji_sdk-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'finishAction-val :lambda-list '(m))
(cl:defmethod finishAction-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:finishAction-val is deprecated.  Use dji_sdk-msg:finishAction instead.")
  (finishAction m))

(cl:ensure-generic-function 'headingMode-val :lambda-list '(m))
(cl:defmethod headingMode-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:headingMode-val is deprecated.  Use dji_sdk-msg:headingMode instead.")
  (headingMode m))

(cl:ensure-generic-function 'gimbalAngle-val :lambda-list '(m))
(cl:defmethod gimbalAngle-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:gimbalAngle-val is deprecated.  Use dji_sdk-msg:gimbalAngle instead.")
  (gimbalAngle m))

(cl:ensure-generic-function 'repeatTimes-val :lambda-list '(m))
(cl:defmethod repeatTimes-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:repeatTimes-val is deprecated.  Use dji_sdk-msg:repeatTimes instead.")
  (repeatTimes m))

(cl:ensure-generic-function 'isUseCam-val :lambda-list '(m))
(cl:defmethod isUseCam-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:isUseCam-val is deprecated.  Use dji_sdk-msg:isUseCam instead.")
  (isUseCam m))

(cl:ensure-generic-function 'sor-val :lambda-list '(m))
(cl:defmethod sor-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:sor-val is deprecated.  Use dji_sdk-msg:sor instead.")
  (sor m))

(cl:ensure-generic-function 'shootVel-val :lambda-list '(m))
(cl:defmethod shootVel-val ((m <WaypointMission>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:shootVel-val is deprecated.  Use dji_sdk-msg:shootVel instead.")
  (shootVel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaypointMission>) ostream)
  "Serializes a message object of type '<WaypointMission>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'missionIndex) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'latLntCount) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'latLntList))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'latLntList))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'actionCount) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'waypointAction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'waypointAction))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'altitude) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'finishAction) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'headingMode) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gimbalAngle) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'repeatTimes) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'isUseCam) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sor) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'shootVel) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaypointMission>) istream)
  "Deserializes a message object of type '<WaypointMission>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'missionIndex) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'latLntCount) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'latLntList) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'latLntList)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'actionCount) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'waypointAction) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'waypointAction)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'altitude) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'finishAction) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'headingMode) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gimbalAngle) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'repeatTimes) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'isUseCam) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sor) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'shootVel) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaypointMission>)))
  "Returns string type for a message object of type '<WaypointMission>"
  "dji_sdk/WaypointMission")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaypointMission)))
  "Returns string type for a message object of type 'WaypointMission"
  "dji_sdk/WaypointMission")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaypointMission>)))
  "Returns md5sum for a message object of type '<WaypointMission>"
  "3cfe4d7c0c45bcdd0d11c1761dfe0b20")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaypointMission)))
  "Returns md5sum for a message object of type 'WaypointMission"
  "3cfe4d7c0c45bcdd0d11c1761dfe0b20")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaypointMission>)))
  "Returns full string definition for message of type '<WaypointMission>"
  (cl:format cl:nil "std_msgs/UInt8 missionIndex~%std_msgs/UInt8 latLntCount~%geometry_msgs/Point[] latLntList~%std_msgs/UInt8 actionCount~%geometry_msgs/Point[] waypointAction~%std_msgs/UInt16 altitude~%std_msgs/UInt8 velocity~%std_msgs/UInt8 finishAction~%std_msgs/UInt8 headingMode~%std_msgs/Int16 gimbalAngle~%std_msgs/UInt8 repeatTimes~%std_msgs/UInt8 isUseCam~%std_msgs/UInt8 sor~%std_msgs/UInt8 shootVel~%~%================================================================================~%MSG: std_msgs/UInt8~%uint8 data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/UInt16~%uint16 data~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaypointMission)))
  "Returns full string definition for message of type 'WaypointMission"
  (cl:format cl:nil "std_msgs/UInt8 missionIndex~%std_msgs/UInt8 latLntCount~%geometry_msgs/Point[] latLntList~%std_msgs/UInt8 actionCount~%geometry_msgs/Point[] waypointAction~%std_msgs/UInt16 altitude~%std_msgs/UInt8 velocity~%std_msgs/UInt8 finishAction~%std_msgs/UInt8 headingMode~%std_msgs/Int16 gimbalAngle~%std_msgs/UInt8 repeatTimes~%std_msgs/UInt8 isUseCam~%std_msgs/UInt8 sor~%std_msgs/UInt8 shootVel~%~%================================================================================~%MSG: std_msgs/UInt8~%uint8 data~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/UInt16~%uint16 data~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaypointMission>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'missionIndex))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'latLntCount))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'latLntList) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'actionCount))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'waypointAction) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'altitude))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'finishAction))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'headingMode))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gimbalAngle))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'repeatTimes))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'isUseCam))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sor))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'shootVel))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaypointMission>))
  "Converts a ROS message object to a list"
  (cl:list 'WaypointMission
    (cl:cons ':missionIndex (missionIndex msg))
    (cl:cons ':latLntCount (latLntCount msg))
    (cl:cons ':latLntList (latLntList msg))
    (cl:cons ':actionCount (actionCount msg))
    (cl:cons ':waypointAction (waypointAction msg))
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':finishAction (finishAction msg))
    (cl:cons ':headingMode (headingMode msg))
    (cl:cons ':gimbalAngle (gimbalAngle msg))
    (cl:cons ':repeatTimes (repeatTimes msg))
    (cl:cons ':isUseCam (isUseCam msg))
    (cl:cons ':sor (sor msg))
    (cl:cons ':shootVel (shootVel msg))
))
