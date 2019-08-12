
(cl:in-package :asdf)

(defsystem "roblink_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GimbalCtl" :depends-on ("_package_GimbalCtl"))
    (:file "_package_GimbalCtl" :depends-on ("_package"))
  ))