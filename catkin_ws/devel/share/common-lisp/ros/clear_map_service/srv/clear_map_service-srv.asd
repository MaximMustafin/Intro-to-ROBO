
(cl:in-package :asdf)

(defsystem "clear_map_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :nav_msgs-msg
)
  :components ((:file "_package")
    (:file "GetMap" :depends-on ("_package_GetMap"))
    (:file "_package_GetMap" :depends-on ("_package"))
  ))