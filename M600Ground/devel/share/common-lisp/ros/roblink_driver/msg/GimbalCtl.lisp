; Auto-generated. Do not edit!


(cl:in-package roblink_driver-msg)


;//! \htmlinclude GimbalCtl.msg.html

(cl:defclass <GimbalCtl> (roslisp-msg-protocol:ros-message)
  ((pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (zoom
    :reader zoom
    :initarg :zoom
    :type cl:float
    :initform 0.0)
   (focus
    :reader focus
    :initarg :focus
    :type cl:float
    :initform 0.0)
   (home
    :reader home
    :initarg :home
    :type cl:fixnum
    :initform 0)
   (TakePicture
    :reader TakePicture
    :initarg :TakePicture
    :type cl:fixnum
    :initform 0)
   (cameraModeChange
    :reader cameraModeChange
    :initarg :cameraModeChange
    :type cl:fixnum
    :initform 0)
   (yawfollow
    :reader yawfollow
    :initarg :yawfollow
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GimbalCtl (<GimbalCtl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalCtl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalCtl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roblink_driver-msg:<GimbalCtl> is deprecated: use roblink_driver-msg:GimbalCtl instead.")))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:pitch-val is deprecated.  Use roblink_driver-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:yaw-val is deprecated.  Use roblink_driver-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'zoom-val :lambda-list '(m))
(cl:defmethod zoom-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:zoom-val is deprecated.  Use roblink_driver-msg:zoom instead.")
  (zoom m))

(cl:ensure-generic-function 'focus-val :lambda-list '(m))
(cl:defmethod focus-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:focus-val is deprecated.  Use roblink_driver-msg:focus instead.")
  (focus m))

(cl:ensure-generic-function 'home-val :lambda-list '(m))
(cl:defmethod home-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:home-val is deprecated.  Use roblink_driver-msg:home instead.")
  (home m))

(cl:ensure-generic-function 'TakePicture-val :lambda-list '(m))
(cl:defmethod TakePicture-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:TakePicture-val is deprecated.  Use roblink_driver-msg:TakePicture instead.")
  (TakePicture m))

(cl:ensure-generic-function 'cameraModeChange-val :lambda-list '(m))
(cl:defmethod cameraModeChange-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:cameraModeChange-val is deprecated.  Use roblink_driver-msg:cameraModeChange instead.")
  (cameraModeChange m))

(cl:ensure-generic-function 'yawfollow-val :lambda-list '(m))
(cl:defmethod yawfollow-val ((m <GimbalCtl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roblink_driver-msg:yawfollow-val is deprecated.  Use roblink_driver-msg:yawfollow instead.")
  (yawfollow m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalCtl>) ostream)
  "Serializes a message object of type '<GimbalCtl>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zoom))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'focus))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'home)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'home)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'TakePicture)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'TakePicture)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cameraModeChange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cameraModeChange)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawfollow)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'yawfollow)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalCtl>) istream)
  "Deserializes a message object of type '<GimbalCtl>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'zoom) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'focus) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'home)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'home)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'TakePicture)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'TakePicture)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cameraModeChange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cameraModeChange)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'yawfollow)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'yawfollow)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalCtl>)))
  "Returns string type for a message object of type '<GimbalCtl>"
  "roblink_driver/GimbalCtl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalCtl)))
  "Returns string type for a message object of type 'GimbalCtl"
  "roblink_driver/GimbalCtl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalCtl>)))
  "Returns md5sum for a message object of type '<GimbalCtl>"
  "3da712e93e361ce644847f1c37d59c65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalCtl)))
  "Returns md5sum for a message object of type 'GimbalCtl"
  "3da712e93e361ce644847f1c37d59c65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalCtl>)))
  "Returns full string definition for message of type '<GimbalCtl>"
  (cl:format cl:nil "float32 pitch~%float32 yaw~%float32 zoom~%float32 focus~%uint16  home~%uint16  TakePicture~%uint16  cameraModeChange~%uint16  yawfollow~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalCtl)))
  "Returns full string definition for message of type 'GimbalCtl"
  (cl:format cl:nil "float32 pitch~%float32 yaw~%float32 zoom~%float32 focus~%uint16  home~%uint16  TakePicture~%uint16  cameraModeChange~%uint16  yawfollow~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalCtl>))
  (cl:+ 0
     4
     4
     4
     4
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalCtl>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalCtl
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':zoom (zoom msg))
    (cl:cons ':focus (focus msg))
    (cl:cons ':home (home msg))
    (cl:cons ':TakePicture (TakePicture msg))
    (cl:cons ':cameraModeChange (cameraModeChange msg))
    (cl:cons ':yawfollow (yawfollow msg))
))
