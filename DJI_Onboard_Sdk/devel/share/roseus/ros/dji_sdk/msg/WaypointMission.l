;; Auto-generated. Do not edit!


(when (boundp 'dji_sdk::WaypointMission)
  (if (not (find-package "DJI_SDK"))
    (make-package "DJI_SDK"))
  (shadow 'WaypointMission (find-package "DJI_SDK")))
(unless (find-package "DJI_SDK::WAYPOINTMISSION")
  (make-package "DJI_SDK::WAYPOINTMISSION"))

(in-package "ROS")
;;//! \htmlinclude WaypointMission.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dji_sdk::WaypointMission
  :super ros::object
  :slots (_missionIndex _latLntCount _latLntList _actionCount _waypointAction _altitude _velocity _finishAction _headingMode _gimbalAngle _repeatTimes _isUseCam _sor _shootVel ))

(defmethod dji_sdk::WaypointMission
  (:init
   (&key
    ((:missionIndex __missionIndex) (instance std_msgs::UInt8 :init))
    ((:latLntCount __latLntCount) (instance std_msgs::UInt8 :init))
    ((:latLntList __latLntList) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:actionCount __actionCount) (instance std_msgs::UInt8 :init))
    ((:waypointAction __waypointAction) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:altitude __altitude) (instance std_msgs::UInt16 :init))
    ((:velocity __velocity) (instance std_msgs::UInt8 :init))
    ((:finishAction __finishAction) (instance std_msgs::UInt8 :init))
    ((:headingMode __headingMode) (instance std_msgs::UInt8 :init))
    ((:gimbalAngle __gimbalAngle) (instance std_msgs::Int16 :init))
    ((:repeatTimes __repeatTimes) (instance std_msgs::UInt8 :init))
    ((:isUseCam __isUseCam) (instance std_msgs::UInt8 :init))
    ((:sor __sor) (instance std_msgs::UInt8 :init))
    ((:shootVel __shootVel) (instance std_msgs::UInt8 :init))
    )
   (send-super :init)
   (setq _missionIndex __missionIndex)
   (setq _latLntCount __latLntCount)
   (setq _latLntList __latLntList)
   (setq _actionCount __actionCount)
   (setq _waypointAction __waypointAction)
   (setq _altitude __altitude)
   (setq _velocity __velocity)
   (setq _finishAction __finishAction)
   (setq _headingMode __headingMode)
   (setq _gimbalAngle __gimbalAngle)
   (setq _repeatTimes __repeatTimes)
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
  (:latLntCount
   (&rest __latLntCount)
   (if (keywordp (car __latLntCount))
       (send* _latLntCount __latLntCount)
     (progn
       (if __latLntCount (setq _latLntCount (car __latLntCount)))
       _latLntCount)))
  (:latLntList
   (&rest __latLntList)
   (if (keywordp (car __latLntList))
       (send* _latLntList __latLntList)
     (progn
       (if __latLntList (setq _latLntList (car __latLntList)))
       _latLntList)))
  (:actionCount
   (&rest __actionCount)
   (if (keywordp (car __actionCount))
       (send* _actionCount __actionCount)
     (progn
       (if __actionCount (setq _actionCount (car __actionCount)))
       _actionCount)))
  (:waypointAction
   (&rest __waypointAction)
   (if (keywordp (car __waypointAction))
       (send* _waypointAction __waypointAction)
     (progn
       (if __waypointAction (setq _waypointAction (car __waypointAction)))
       _waypointAction)))
  (:altitude
   (&rest __altitude)
   (if (keywordp (car __altitude))
       (send* _altitude __altitude)
     (progn
       (if __altitude (setq _altitude (car __altitude)))
       _altitude)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:finishAction
   (&rest __finishAction)
   (if (keywordp (car __finishAction))
       (send* _finishAction __finishAction)
     (progn
       (if __finishAction (setq _finishAction (car __finishAction)))
       _finishAction)))
  (:headingMode
   (&rest __headingMode)
   (if (keywordp (car __headingMode))
       (send* _headingMode __headingMode)
     (progn
       (if __headingMode (setq _headingMode (car __headingMode)))
       _headingMode)))
  (:gimbalAngle
   (&rest __gimbalAngle)
   (if (keywordp (car __gimbalAngle))
       (send* _gimbalAngle __gimbalAngle)
     (progn
       (if __gimbalAngle (setq _gimbalAngle (car __gimbalAngle)))
       _gimbalAngle)))
  (:repeatTimes
   (&rest __repeatTimes)
   (if (keywordp (car __repeatTimes))
       (send* _repeatTimes __repeatTimes)
     (progn
       (if __repeatTimes (setq _repeatTimes (car __repeatTimes)))
       _repeatTimes)))
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
    ;; std_msgs/UInt8 _latLntCount
    (send _latLntCount :serialization-length)
    ;; geometry_msgs/Point[] _latLntList
    (apply #'+ (send-all _latLntList :serialization-length)) 4
    ;; std_msgs/UInt8 _actionCount
    (send _actionCount :serialization-length)
    ;; geometry_msgs/Point[] _waypointAction
    (apply #'+ (send-all _waypointAction :serialization-length)) 4
    ;; std_msgs/UInt16 _altitude
    (send _altitude :serialization-length)
    ;; std_msgs/UInt8 _velocity
    (send _velocity :serialization-length)
    ;; std_msgs/UInt8 _finishAction
    (send _finishAction :serialization-length)
    ;; std_msgs/UInt8 _headingMode
    (send _headingMode :serialization-length)
    ;; std_msgs/Int16 _gimbalAngle
    (send _gimbalAngle :serialization-length)
    ;; std_msgs/UInt8 _repeatTimes
    (send _repeatTimes :serialization-length)
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
     ;; std_msgs/UInt8 _latLntCount
       (send _latLntCount :serialize s)
     ;; geometry_msgs/Point[] _latLntList
     (write-long (length _latLntList) s)
     (dolist (elem _latLntList)
       (send elem :serialize s)
       )
     ;; std_msgs/UInt8 _actionCount
       (send _actionCount :serialize s)
     ;; geometry_msgs/Point[] _waypointAction
     (write-long (length _waypointAction) s)
     (dolist (elem _waypointAction)
       (send elem :serialize s)
       )
     ;; std_msgs/UInt16 _altitude
       (send _altitude :serialize s)
     ;; std_msgs/UInt8 _velocity
       (send _velocity :serialize s)
     ;; std_msgs/UInt8 _finishAction
       (send _finishAction :serialize s)
     ;; std_msgs/UInt8 _headingMode
       (send _headingMode :serialize s)
     ;; std_msgs/Int16 _gimbalAngle
       (send _gimbalAngle :serialize s)
     ;; std_msgs/UInt8 _repeatTimes
       (send _repeatTimes :serialize s)
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
   ;; std_msgs/UInt8 _latLntCount
     (send _latLntCount :deserialize buf ptr-) (incf ptr- (send _latLntCount :serialization-length))
   ;; geometry_msgs/Point[] _latLntList
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _latLntList (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _latLntList)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/UInt8 _actionCount
     (send _actionCount :deserialize buf ptr-) (incf ptr- (send _actionCount :serialization-length))
   ;; geometry_msgs/Point[] _waypointAction
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypointAction (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _waypointAction)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/UInt16 _altitude
     (send _altitude :deserialize buf ptr-) (incf ptr- (send _altitude :serialization-length))
   ;; std_msgs/UInt8 _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; std_msgs/UInt8 _finishAction
     (send _finishAction :deserialize buf ptr-) (incf ptr- (send _finishAction :serialization-length))
   ;; std_msgs/UInt8 _headingMode
     (send _headingMode :deserialize buf ptr-) (incf ptr- (send _headingMode :serialization-length))
   ;; std_msgs/Int16 _gimbalAngle
     (send _gimbalAngle :deserialize buf ptr-) (incf ptr- (send _gimbalAngle :serialization-length))
   ;; std_msgs/UInt8 _repeatTimes
     (send _repeatTimes :deserialize buf ptr-) (incf ptr- (send _repeatTimes :serialization-length))
   ;; std_msgs/UInt8 _isUseCam
     (send _isUseCam :deserialize buf ptr-) (incf ptr- (send _isUseCam :serialization-length))
   ;; std_msgs/UInt8 _sor
     (send _sor :deserialize buf ptr-) (incf ptr- (send _sor :serialization-length))
   ;; std_msgs/UInt8 _shootVel
     (send _shootVel :deserialize buf ptr-) (incf ptr- (send _shootVel :serialization-length))
   ;;
   self)
  )

(setf (get dji_sdk::WaypointMission :md5sum-) "3cfe4d7c0c45bcdd0d11c1761dfe0b20")
(setf (get dji_sdk::WaypointMission :datatype-) "dji_sdk/WaypointMission")
(setf (get dji_sdk::WaypointMission :definition-)
      "std_msgs/UInt8 missionIndex
std_msgs/UInt8 latLntCount
geometry_msgs/Point[] latLntList
std_msgs/UInt8 actionCount
geometry_msgs/Point[] waypointAction
std_msgs/UInt16 altitude
std_msgs/UInt8 velocity
std_msgs/UInt8 finishAction
std_msgs/UInt8 headingMode
std_msgs/Int16 gimbalAngle
std_msgs/UInt8 repeatTimes
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



(provide :dji_sdk/WaypointMission "3cfe4d7c0c45bcdd0d11c1761dfe0b20")


