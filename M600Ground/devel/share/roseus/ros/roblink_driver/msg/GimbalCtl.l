;; Auto-generated. Do not edit!


(when (boundp 'roblink_driver::GimbalCtl)
  (if (not (find-package "ROBLINK_DRIVER"))
    (make-package "ROBLINK_DRIVER"))
  (shadow 'GimbalCtl (find-package "ROBLINK_DRIVER")))
(unless (find-package "ROBLINK_DRIVER::GIMBALCTL")
  (make-package "ROBLINK_DRIVER::GIMBALCTL"))

(in-package "ROS")
;;//! \htmlinclude GimbalCtl.msg.html


(defclass roblink_driver::GimbalCtl
  :super ros::object
  :slots (_pitch _yaw _zoom _focus _home _TakePicture _cameraModeChange _yawfollow ))

(defmethod roblink_driver::GimbalCtl
  (:init
   (&key
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:zoom __zoom) 0.0)
    ((:focus __focus) 0.0)
    ((:home __home) 0)
    ((:TakePicture __TakePicture) 0)
    ((:cameraModeChange __cameraModeChange) 0)
    ((:yawfollow __yawfollow) 0)
    )
   (send-super :init)
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _zoom (float __zoom))
   (setq _focus (float __focus))
   (setq _home (round __home))
   (setq _TakePicture (round __TakePicture))
   (setq _cameraModeChange (round __cameraModeChange))
   (setq _yawfollow (round __yawfollow))
   self)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:zoom
   (&optional __zoom)
   (if __zoom (setq _zoom __zoom)) _zoom)
  (:focus
   (&optional __focus)
   (if __focus (setq _focus __focus)) _focus)
  (:home
   (&optional __home)
   (if __home (setq _home __home)) _home)
  (:TakePicture
   (&optional __TakePicture)
   (if __TakePicture (setq _TakePicture __TakePicture)) _TakePicture)
  (:cameraModeChange
   (&optional __cameraModeChange)
   (if __cameraModeChange (setq _cameraModeChange __cameraModeChange)) _cameraModeChange)
  (:yawfollow
   (&optional __yawfollow)
   (if __yawfollow (setq _yawfollow __yawfollow)) _yawfollow)
  (:serialization-length
   ()
   (+
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float32 _zoom
    4
    ;; float32 _focus
    4
    ;; uint16 _home
    2
    ;; uint16 _TakePicture
    2
    ;; uint16 _cameraModeChange
    2
    ;; uint16 _yawfollow
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zoom
       (sys::poke _zoom (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _focus
       (sys::poke _focus (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint16 _home
       (write-word _home s)
     ;; uint16 _TakePicture
       (write-word _TakePicture s)
     ;; uint16 _cameraModeChange
       (write-word _cameraModeChange s)
     ;; uint16 _yawfollow
       (write-word _yawfollow s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zoom
     (setq _zoom (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _focus
     (setq _focus (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint16 _home
     (setq _home (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _TakePicture
     (setq _TakePicture (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _cameraModeChange
     (setq _cameraModeChange (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _yawfollow
     (setq _yawfollow (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get roblink_driver::GimbalCtl :md5sum-) "3da712e93e361ce644847f1c37d59c65")
(setf (get roblink_driver::GimbalCtl :datatype-) "roblink_driver/GimbalCtl")
(setf (get roblink_driver::GimbalCtl :definition-)
      "float32 pitch
float32 yaw
float32 zoom
float32 focus
uint16  home
uint16  TakePicture
uint16  cameraModeChange
uint16  yawfollow

")



(provide :roblink_driver/GimbalCtl "3da712e93e361ce644847f1c37d59c65")


