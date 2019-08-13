;; Auto-generated. Do not edit!


(when (boundp 'dji_sdk::Emergency)
  (if (not (find-package "DJI_SDK"))
    (make-package "DJI_SDK"))
  (shadow 'Emergency (find-package "DJI_SDK")))
(unless (find-package "DJI_SDK::EMERGENCY")
  (make-package "DJI_SDK::EMERGENCY"))

(in-package "ROS")
;;//! \htmlinclude Emergency.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dji_sdk::Emergency
  :super ros::object
  :slots (_home _land _hover _takeOff ))

(defmethod dji_sdk::Emergency
  (:init
   (&key
    ((:home __home) (instance std_msgs::UInt8 :init))
    ((:land __land) (instance std_msgs::UInt8 :init))
    ((:hover __hover) (instance std_msgs::UInt8 :init))
    ((:takeOff __takeOff) (instance std_msgs::UInt8 :init))
    )
   (send-super :init)
   (setq _home __home)
   (setq _land __land)
   (setq _hover __hover)
   (setq _takeOff __takeOff)
   self)
  (:home
   (&rest __home)
   (if (keywordp (car __home))
       (send* _home __home)
     (progn
       (if __home (setq _home (car __home)))
       _home)))
  (:land
   (&rest __land)
   (if (keywordp (car __land))
       (send* _land __land)
     (progn
       (if __land (setq _land (car __land)))
       _land)))
  (:hover
   (&rest __hover)
   (if (keywordp (car __hover))
       (send* _hover __hover)
     (progn
       (if __hover (setq _hover (car __hover)))
       _hover)))
  (:takeOff
   (&rest __takeOff)
   (if (keywordp (car __takeOff))
       (send* _takeOff __takeOff)
     (progn
       (if __takeOff (setq _takeOff (car __takeOff)))
       _takeOff)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/UInt8 _home
    (send _home :serialization-length)
    ;; std_msgs/UInt8 _land
    (send _land :serialization-length)
    ;; std_msgs/UInt8 _hover
    (send _hover :serialization-length)
    ;; std_msgs/UInt8 _takeOff
    (send _takeOff :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/UInt8 _home
       (send _home :serialize s)
     ;; std_msgs/UInt8 _land
       (send _land :serialize s)
     ;; std_msgs/UInt8 _hover
       (send _hover :serialize s)
     ;; std_msgs/UInt8 _takeOff
       (send _takeOff :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/UInt8 _home
     (send _home :deserialize buf ptr-) (incf ptr- (send _home :serialization-length))
   ;; std_msgs/UInt8 _land
     (send _land :deserialize buf ptr-) (incf ptr- (send _land :serialization-length))
   ;; std_msgs/UInt8 _hover
     (send _hover :deserialize buf ptr-) (incf ptr- (send _hover :serialization-length))
   ;; std_msgs/UInt8 _takeOff
     (send _takeOff :deserialize buf ptr-) (incf ptr- (send _takeOff :serialization-length))
   ;;
   self)
  )

(setf (get dji_sdk::Emergency :md5sum-) "1d411b8cc595547a01bef8995efbdc30")
(setf (get dji_sdk::Emergency :datatype-) "dji_sdk/Emergency")
(setf (get dji_sdk::Emergency :definition-)
      "std_msgs/UInt8 home
std_msgs/UInt8 land
std_msgs/UInt8 hover
std_msgs/UInt8 takeOff

================================================================================
MSG: std_msgs/UInt8
uint8 data

")



(provide :dji_sdk/Emergency "1d411b8cc595547a01bef8995efbdc30")


