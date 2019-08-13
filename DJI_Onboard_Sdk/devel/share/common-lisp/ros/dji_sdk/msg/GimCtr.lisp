; Auto-generated. Do not edit!


(cl:in-package dji_sdk-msg)


;//! \htmlinclude GimCtr.msg.html

(cl:defclass <GimCtr> (roslisp-msg-protocol:ros-message)
  ((pry
    :reader pry
    :initarg :pry
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (mutiple
    :reader mutiple
    :initarg :mutiple
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (setFcus
    :reader setFcus
    :initarg :setFcus
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (reset
    :reader reset
    :initarg :reset
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (sos
    :reader sos
    :initarg :sos
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (sor
    :reader sor
    :initarg :sor
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32)))
)

(cl:defclass GimCtr (<GimCtr>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimCtr>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimCtr)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dji_sdk-msg:<GimCtr> is deprecated: use dji_sdk-msg:GimCtr instead.")))

(cl:ensure-generic-function 'pry-val :lambda-list '(m))
(cl:defmethod pry-val ((m <GimCtr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:pry-val is deprecated.  Use dji_sdk-msg:pry instead.")
  (pry m))

(cl:ensure-generic-function 'mutiple-val :lambda-list '(m))
(cl:defmethod mutiple-val ((m <GimCtr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:mutiple-val is deprecated.  Use dji_sdk-msg:mutiple instead.")
  (mutiple m))

(cl:ensure-generic-function 'setFcus-val :lambda-list '(m))
(cl:defmethod setFcus-val ((m <GimCtr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:setFcus-val is deprecated.  Use dji_sdk-msg:setFcus instead.")
  (setFcus m))

(cl:ensure-generic-function 'reset-val :lambda-list '(m))
(cl:defmethod reset-val ((m <GimCtr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:reset-val is deprecated.  Use dji_sdk-msg:reset instead.")
  (reset m))

(cl:ensure-generic-function 'sos-val :lambda-list '(m))
(cl:defmethod sos-val ((m <GimCtr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:sos-val is deprecated.  Use dji_sdk-msg:sos instead.")
  (sos m))

(cl:ensure-generic-function 'sor-val :lambda-list '(m))
(cl:defmethod sor-val ((m <GimCtr>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dji_sdk-msg:sor-val is deprecated.  Use dji_sdk-msg:sor instead.")
  (sor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimCtr>) ostream)
  "Serializes a message object of type '<GimCtr>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pry) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mutiple) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'setFcus) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'reset) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sor) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimCtr>) istream)
  "Deserializes a message object of type '<GimCtr>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pry) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mutiple) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'setFcus) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'reset) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sor) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimCtr>)))
  "Returns string type for a message object of type '<GimCtr>"
  "dji_sdk/GimCtr")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimCtr)))
  "Returns string type for a message object of type 'GimCtr"
  "dji_sdk/GimCtr")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimCtr>)))
  "Returns md5sum for a message object of type '<GimCtr>"
  "884bd8fe246ac26d7bb87013a1d884c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimCtr)))
  "Returns md5sum for a message object of type 'GimCtr"
  "884bd8fe246ac26d7bb87013a1d884c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimCtr>)))
  "Returns full string definition for message of type '<GimCtr>"
  (cl:format cl:nil "geometry_msgs/Point pry~%std_msgs/Int32 mutiple~%std_msgs/Int32 setFcus~%std_msgs/Int32 reset~%std_msgs/Int32 sos~%std_msgs/Int32 sor~%		~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimCtr)))
  "Returns full string definition for message of type 'GimCtr"
  (cl:format cl:nil "geometry_msgs/Point pry~%std_msgs/Int32 mutiple~%std_msgs/Int32 setFcus~%std_msgs/Int32 reset~%std_msgs/Int32 sos~%std_msgs/Int32 sor~%		~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimCtr>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pry))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mutiple))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'setFcus))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'reset))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sor))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimCtr>))
  "Converts a ROS message object to a list"
  (cl:list 'GimCtr
    (cl:cons ':pry (pry msg))
    (cl:cons ':mutiple (mutiple msg))
    (cl:cons ':setFcus (setFcus msg))
    (cl:cons ':reset (reset msg))
    (cl:cons ':sos (sos msg))
    (cl:cons ':sor (sor msg))
))
