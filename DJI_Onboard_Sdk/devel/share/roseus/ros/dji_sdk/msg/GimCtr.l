;; Auto-generated. Do not edit!


(when (boundp 'dji_sdk::GimCtr)
  (if (not (find-package "DJI_SDK"))
    (make-package "DJI_SDK"))
  (shadow 'GimCtr (find-package "DJI_SDK")))
(unless (find-package "DJI_SDK::GIMCTR")
  (make-package "DJI_SDK::GIMCTR"))

(in-package "ROS")
;;//! \htmlinclude GimCtr.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dji_sdk::GimCtr
  :super ros::object
  :slots (_pry _mutiple _setFcus _reset _sos _sor ))

(defmethod dji_sdk::GimCtr
  (:init
   (&key
    ((:pry __pry) (instance geometry_msgs::Point :init))
    ((:mutiple __mutiple) (instance std_msgs::Int32 :init))
    ((:setFcus __setFcus) (instance std_msgs::Int32 :init))
    ((:reset __reset) (instance std_msgs::Int32 :init))
    ((:sos __sos) (instance std_msgs::Int32 :init))
    ((:sor __sor) (instance std_msgs::Int32 :init))
    )
   (send-super :init)
   (setq _pry __pry)
   (setq _mutiple __mutiple)
   (setq _setFcus __setFcus)
   (setq _reset __reset)
   (setq _sos __sos)
   (setq _sor __sor)
   self)
  (:pry
   (&rest __pry)
   (if (keywordp (car __pry))
       (send* _pry __pry)
     (progn
       (if __pry (setq _pry (car __pry)))
       _pry)))
  (:mutiple
   (&rest __mutiple)
   (if (keywordp (car __mutiple))
       (send* _mutiple __mutiple)
     (progn
       (if __mutiple (setq _mutiple (car __mutiple)))
       _mutiple)))
  (:setFcus
   (&rest __setFcus)
   (if (keywordp (car __setFcus))
       (send* _setFcus __setFcus)
     (progn
       (if __setFcus (setq _setFcus (car __setFcus)))
       _setFcus)))
  (:reset
   (&rest __reset)
   (if (keywordp (car __reset))
       (send* _reset __reset)
     (progn
       (if __reset (setq _reset (car __reset)))
       _reset)))
  (:sos
   (&rest __sos)
   (if (keywordp (car __sos))
       (send* _sos __sos)
     (progn
       (if __sos (setq _sos (car __sos)))
       _sos)))
  (:sor
   (&rest __sor)
   (if (keywordp (car __sor))
       (send* _sor __sor)
     (progn
       (if __sor (setq _sor (car __sor)))
       _sor)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _pry
    (send _pry :serialization-length)
    ;; std_msgs/Int32 _mutiple
    (send _mutiple :serialization-length)
    ;; std_msgs/Int32 _setFcus
    (send _setFcus :serialization-length)
    ;; std_msgs/Int32 _reset
    (send _reset :serialization-length)
    ;; std_msgs/Int32 _sos
    (send _sos :serialization-length)
    ;; std_msgs/Int32 _sor
    (send _sor :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _pry
       (send _pry :serialize s)
     ;; std_msgs/Int32 _mutiple
       (send _mutiple :serialize s)
     ;; std_msgs/Int32 _setFcus
       (send _setFcus :serialize s)
     ;; std_msgs/Int32 _reset
       (send _reset :serialize s)
     ;; std_msgs/Int32 _sos
       (send _sos :serialize s)
     ;; std_msgs/Int32 _sor
       (send _sor :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _pry
     (send _pry :deserialize buf ptr-) (incf ptr- (send _pry :serialization-length))
   ;; std_msgs/Int32 _mutiple
     (send _mutiple :deserialize buf ptr-) (incf ptr- (send _mutiple :serialization-length))
   ;; std_msgs/Int32 _setFcus
     (send _setFcus :deserialize buf ptr-) (incf ptr- (send _setFcus :serialization-length))
   ;; std_msgs/Int32 _reset
     (send _reset :deserialize buf ptr-) (incf ptr- (send _reset :serialization-length))
   ;; std_msgs/Int32 _sos
     (send _sos :deserialize buf ptr-) (incf ptr- (send _sos :serialization-length))
   ;; std_msgs/Int32 _sor
     (send _sor :deserialize buf ptr-) (incf ptr- (send _sor :serialization-length))
   ;;
   self)
  )

(setf (get dji_sdk::GimCtr :md5sum-) "884bd8fe246ac26d7bb87013a1d884c1")
(setf (get dji_sdk::GimCtr :datatype-) "dji_sdk/GimCtr")
(setf (get dji_sdk::GimCtr :definition-)
      "geometry_msgs/Point pry
std_msgs/Int32 mutiple
std_msgs/Int32 setFcus
std_msgs/Int32 reset
std_msgs/Int32 sos
std_msgs/Int32 sor
		


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/Int32
int32 data
")



(provide :dji_sdk/GimCtr "884bd8fe246ac26d7bb87013a1d884c1")


