;; Auto-generated. Do not edit!


(when (boundp 'dji_sdk::HotpointMission)
  (if (not (find-package "DJI_SDK"))
    (make-package "DJI_SDK"))
  (shadow 'HotpointMission (find-package "DJI_SDK")))
(unless (find-package "DJI_SDK::HOTPOINTMISSION")
  (make-package "DJI_SDK::HOTPOINTMISSION"))

(in-package "ROS")
;;//! \htmlinclude HotpointMission.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dji_sdk::HotpointMission
  :super ros::object
  :slots (_missionIndex _hotpoint _startHotPoint _headingMode _altitude _angleVel _radius _gimbalAngle _clockwise _isUseCam _sor _shootVel ))

(defmethod dji_sdk::HotpointMission
  (:init
   (&key
    ((:missionIndex __missionIndex) (instance std_msgs::UInt8 :init))
    ((:hotpoint __hotpoint) (instance geometry_msgs::Point :init))
    ((:startHotPoint __startHotPoint) (instance std_msgs::UInt8 :init))
    ((:headingMode __headingMode) (instance std_msgs::UInt8 :init))
    ((:altitude __altitude) (instance std_msgs::UInt16 :init))
    ((:angleVel __angleVel) (instance std_msgs::UInt8 :init))
    ((:radius __radius) (instance std_msgs::UInt16 :init))
    ((:gimbalAngle __gimbalAngle) (instance std_msgs::Int16 :init))
    ((:clockwise __clockwise) (instance std_msgs::UInt8 :init))
    ((:isUseCam __isUseCam) (instance std_msgs::UInt8 :init))
    ((:sor __sor) (instance std_msgs::UInt8 :init))
    ((:shootVel __shootVel) (instance std_msgs::UInt8 :init))
    )
   (send-super :init)
   (setq _missionIndex __missionIndex)
   (setq _hotpoint __hotpoint)
   (setq _startHotPoint __startHotPoint)
   (setq _headingMode __headingMode)
   (setq _altitude __altitude)
   (setq _angleVel __angleVel)
   (setq _radius __radius)
   (setq _gimbalAngle __gimbalAngle)
   (setq _clockwise __clockwise)
   (setq _isUseCam __isUseCam)
   (setq _sor __sor)
   (setq _shootVel __shootVel)
   self)
  (:missionIndex
   (&rest __missionIndex)
   (if (keywordp (car __missionIndex))
       (send* _missionIndex __missionIndex)
     (progn
       (if __missionIndex (setq _missionIndex (car __missionIndex)))
       _missionIndex)))
  (:hotpoint
   (&rest __hotpoint)
   (if (keywordp (car __hotpoint))
       (send* _hotpoint __hotpoint)
     (progn
       (if __hotpoint (setq _hotpoint (car __hotpoint)))
       _hotpoint)))
  (:startHotPoint
   (&rest __startHotPoint)
   (if (keywordp (car __startHotPoint))
       (send* _startHotPoint __startHotPoint)
     (progn
       (if __startHotPoint (setq _startHotPoint (car __startHotPoint)))
       _startHotPoint)))
  (:headingMode
   (&rest __headingMode)
   (if (keywordp (car __headingMode))
       (send* _headingMode __headingMode)
     (progn
       (if __headingMode (setq _headingMode (car __headingMode)))
       _headingMode)))
  (:altitude
   (&rest __altitude)
   (if (keywordp (car __altitude))
       (send* _altitude __altitude)
     (progn
       (if __altitude (setq _altitude (car __altitude)))
       _altitude)))
  (:angleVel
   (&rest __angleVel)
   (if (keywordp (car __angleVel))
       (send* _angleVel __angleVel)
     (progn
       (if __angleVel (setq _angleVel (car __angleVel)))
       _angleVel)))
  (:radius
   (&rest __radius)
   (if (keywordp (car __radius))
       (send* _radius __radius)
     (progn
       (if __radius (setq _radius (car __radius)))
       _radius)))
  (:gimbalAngle
   (&rest __gimbalAngle)
   (if (keywordp (car __gimbalAngle))
       (send* _gimbalAngle __gimbalAngle)
     (progn
       (if __gimbalAngle (setq _gimbalAngle (car __gimbalAngle)))
       _gimbalAngle)))
  (:clockwise
   (&rest __clockwise)
   (if (keywordp (car __clockwise))
       (send* _clockwise __clockwise)
     (progn
       (if __clockwise (setq _clockwise (car __clockwise)))
       _clockwise)))
  (:isUseCam
   (&rest __isUseCam)
   (if (keywordp (car __isUseCam))
       (send* _isUseCam __isUseCam)
     (progn
       (if __isUseCam (setq _isUseCam (car __isUseCam)))
       _isUseCam)))
  (:sor
   (&rest __sor)
   (if (keywordp (car __sor))
       (send* _sor __sor)
     (progn
       (if __sor (setq _sor (car __sor)))
       _sor)))
  (:shootVel
   (&rest __shootVel)
   (if (keywordp (car __shootVel))
       (send* _shootVel __shootVel)
     (progn
       (if __shootVel (setq _shootVel (car __shootVel)))
       _shootVel)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/UInt8 _missionIndex
    (send _missionIndex :serialization-length)
    ;; geometry_msgs/Point _hotpoint
    (send _hotpoint :serialization-length)
    ;; std_msgs/UInt8 _startHotPoint
    (send _startHotPoint :serialization-length)
    ;; std_msgs/UInt8 _headingMode
    (send _headingMode :serialization-length)
    ;; std_msgs/UInt16 _altitude
    (send _altitude :serialization-length)
    ;; std_msgs/UInt8 _angleVel
    (send _angleVel :serialization-length)
    ;; std_msgs/UInt16 _radius
    (send _radius :serialization-length)
    ;; std_msgs/Int16 _gimbalAngle
    (send _gimbalAngle :serialization-length)
    ;; std_msgs/UInt8 _clockwise
    (send _clockwise :serialization-length)
    ;; std_msgs/UInt8 _isUseCam
    (send _isUseCam :serialization-length)
    ;; std_msgs/UInt8 _sor
    (send _sor :serialization-length)
    ;; std_msgs/UInt8 _shootVel
    (send _shootVel :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/UInt8 _missionIndex
       (send _missionIndex :serialize s)
     ;; geometry_msgs/Point _hotpoint
       (send _hotpoint :serialize s)
     ;; std_msgs/UInt8 _startHotPoint
       (send _startHotPoint :serialize s)
     ;; std_msgs/UInt8 _headingMode
       (send _headingMode :serialize s)
     ;; std_msgs/UInt16 _altitude
       (send _altitude :serialize s)
     ;; std_msgs/UInt8 _angleVel
       (send _angleVel :serialize s)
     ;; std_msgs/UInt16 _radius
       (send _radius :serialize s)
     ;; std_msgs/Int16 _gimbalAngle
       (send _gimbalAngle :serialize s)
     ;; std_msgs/UInt8 _clockwise
       (send _clockwise :serialize s)
     ;; std_msgs/UInt8 _isUseCam
       (send _isUseCam :serialize s)
     ;; std_msgs/UInt8 _sor
       (send _sor :serialize s)
     ;; std_msgs/UInt8 _shootVel
       (send _shootVel :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/UInt8 _missionIndex
     (send _missionIndex :deserialize buf ptr-) (incf ptr- (send _missionIndex :serialization-length))
   ;; geometry_msgs/Point _hotpoint
     (send _hotpoint :deserialize buf ptr-) (incf ptr- (send _hotpoint :serialization-length))
   ;; std_msgs/UInt8 _startHotPoint
     (send _startHotPoint :deserialize buf ptr-) (incf ptr- (send _startHotPoint :serialization-length))
   ;; std_msgs/UInt8 _headingMode
     (send _headingMode :deserialize buf ptr-) (incf ptr- (send _headingMode :serialization-length))
   ;; std_msgs/UInt16 _altitude
     (send _altitude :deserialize buf ptr-) (incf ptr- (send _altitude :serialization-length))
   ;; std_msgs/UInt8 _angleVel
     (send _angleVel :deserialize buf ptr-) (incf ptr- (send _angleVel :serialization-length))
   ;; std_msgs/UInt16 _radius
     (send _radius :deserialize buf ptr-) (incf ptr- (send _radius :serialization-length))
   ;; std_msgs/Int16 _gimbalAngle
     (send _gimbalAngle :deserialize buf ptr-) (incf ptr- (send _gimbalAngle :serialization-length))
   ;; std_msgs/UInt8 _clockwise
     (send _clockwise :deserialize buf ptr-) (incf ptr- (send _clockwise :serialization-length))
   ;; std_msgs/UInt8 _isUseCam
     (send _isUseCam :deserialize buf ptr-) (incf ptr- (send _isUseCam :serialization-length))
   ;; std_msgs/UInt8 _sor
     (send _sor :deserialize buf ptr-) (incf ptr- (send _sor :serialization-length))
   ;; std_msgs/UInt8 _shootVel
     (send _shootVel :deserialize buf ptr-) (incf ptr- (send _shootVel :serialization-length))
   ;;
   self)
  )

(setf (get dji_sdk::HotpointMission :md5sum-) "1275f1566cde5c929e0caa2875c0e3c4")
(setf (get dji_sdk::HotpointMission :datatype-) "dji_sdk/HotpointMission")
(setf (get dji_sdk::HotpointMission :definition-)
      "std_msgs/UInt8 missionIndex
geometry_msgs/Point hotpoint
std_msgs/UInt8 startHotPoint
std_msgs/UInt8 headingMode
std_msgs/UInt16 altitude
std_msgs/UInt8 angleVel
std_msgs/UInt16 radius
std_msgs/Int16 gimbalAngle
std_msgs/UInt8 clockwise
std_msgs/UInt8 isUseCam
std_msgs/UInt8 sor
std_msgs/UInt8 shootVel

================================================================================
MSG: std_msgs/UInt8
uint8 data

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/UInt16
uint16 data

================================================================================
MSG: std_msgs/Int16
int16 data

")



(provide :dji_sdk/HotpointMission "1275f1566cde5c929e0caa2875c0e3c4")


