;; Auto-generated. Do not edit!


(when (boundp 'custom_services::MeanThreeInts)
  (if (not (find-package "CUSTOM_SERVICES"))
    (make-package "CUSTOM_SERVICES"))
  (shadow 'MeanThreeInts (find-package "CUSTOM_SERVICES")))
(unless (find-package "CUSTOM_SERVICES::MEANTHREEINTS")
  (make-package "CUSTOM_SERVICES::MEANTHREEINTS"))
(unless (find-package "CUSTOM_SERVICES::MEANTHREEINTSREQUEST")
  (make-package "CUSTOM_SERVICES::MEANTHREEINTSREQUEST"))
(unless (find-package "CUSTOM_SERVICES::MEANTHREEINTSRESPONSE")
  (make-package "CUSTOM_SERVICES::MEANTHREEINTSRESPONSE"))

(in-package "ROS")





(defclass custom_services::MeanThreeIntsRequest
  :super ros::object
  :slots (_a _b _c ))

(defmethod custom_services::MeanThreeIntsRequest
  (:init
   (&key
    ((:a __a) 0)
    ((:b __b) 0)
    ((:c __c) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   (setq _b (round __b))
   (setq _c (round __c))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:serialization-length
   ()
   (+
    ;; int64 _a
    8
    ;; int64 _b
    8
    ;; int64 _c
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _a
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _a (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _a) (= (length (_a . bv)) 2)) ;; bignum
              (write-long (ash (elt (_a . bv) 0) 0) s)
              (write-long (ash (elt (_a . bv) 1) -1) s))
             ((and (class _a) (= (length (_a . bv)) 1)) ;; big1
              (write-long (elt (_a . bv) 0) s)
              (write-long (if (>= _a 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _a s)(write-long (if (>= _a 0) 0 #xffffffff) s)))
     ;; int64 _b
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _b (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _b) (= (length (_b . bv)) 2)) ;; bignum
              (write-long (ash (elt (_b . bv) 0) 0) s)
              (write-long (ash (elt (_b . bv) 1) -1) s))
             ((and (class _b) (= (length (_b . bv)) 1)) ;; big1
              (write-long (elt (_b . bv) 0) s)
              (write-long (if (>= _b 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _b s)(write-long (if (>= _b 0) 0 #xffffffff) s)))
     ;; int64 _c
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _c (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _c) (= (length (_c . bv)) 2)) ;; bignum
              (write-long (ash (elt (_c . bv) 0) 0) s)
              (write-long (ash (elt (_c . bv) 1) -1) s))
             ((and (class _c) (= (length (_c . bv)) 1)) ;; big1
              (write-long (elt (_c . bv) 0) s)
              (write-long (if (>= _c 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _c s)(write-long (if (>= _c 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _a
#+(or :alpha :irix6 :x86_64)
      (setf _a (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _a (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _b
#+(or :alpha :irix6 :x86_64)
      (setf _b (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _b (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _c
#+(or :alpha :irix6 :x86_64)
      (setf _c (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _c (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass custom_services::MeanThreeIntsResponse
  :super ros::object
  :slots (_mean ))

(defmethod custom_services::MeanThreeIntsResponse
  (:init
   (&key
    ((:mean __mean) 0.0)
    )
   (send-super :init)
   (setq _mean (float __mean))
   self)
  (:mean
   (&optional __mean)
   (if __mean (setq _mean __mean)) _mean)
  (:serialization-length
   ()
   (+
    ;; float64 _mean
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _mean
       (sys::poke _mean (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _mean
     (setq _mean (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass custom_services::MeanThreeInts
  :super ros::object
  :slots ())

(setf (get custom_services::MeanThreeInts :md5sum-) "f30a58e2837f4b803e4927983e2be21f")
(setf (get custom_services::MeanThreeInts :datatype-) "custom_services/MeanThreeInts")
(setf (get custom_services::MeanThreeInts :request) custom_services::MeanThreeIntsRequest)
(setf (get custom_services::MeanThreeInts :response) custom_services::MeanThreeIntsResponse)

(defmethod custom_services::MeanThreeIntsRequest
  (:response () (instance custom_services::MeanThreeIntsResponse :init)))

(setf (get custom_services::MeanThreeIntsRequest :md5sum-) "f30a58e2837f4b803e4927983e2be21f")
(setf (get custom_services::MeanThreeIntsRequest :datatype-) "custom_services/MeanThreeIntsRequest")
(setf (get custom_services::MeanThreeIntsRequest :definition-)
      "int64 a
int64 b
int64 c
---
float64 mean

")

(setf (get custom_services::MeanThreeIntsResponse :md5sum-) "f30a58e2837f4b803e4927983e2be21f")
(setf (get custom_services::MeanThreeIntsResponse :datatype-) "custom_services/MeanThreeIntsResponse")
(setf (get custom_services::MeanThreeIntsResponse :definition-)
      "int64 a
int64 b
int64 c
---
float64 mean

")



(provide :custom_services/MeanThreeInts "f30a58e2837f4b803e4927983e2be21f")


