
(cl:in-package :asdf)

(defsystem "custom_services-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MeanThreeInts" :depends-on ("_package_MeanThreeInts"))
    (:file "_package_MeanThreeInts" :depends-on ("_package"))
  ))