;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_sdk_examples::GetPosition)
  (if (not (find-package "DYNAMIXEL_SDK_EXAMPLES"))
    (make-package "DYNAMIXEL_SDK_EXAMPLES"))
  (shadow 'GetPosition (find-package "DYNAMIXEL_SDK_EXAMPLES")))
(unless (find-package "DYNAMIXEL_SDK_EXAMPLES::GETPOSITION")
  (make-package "DYNAMIXEL_SDK_EXAMPLES::GETPOSITION"))
(unless (find-package "DYNAMIXEL_SDK_EXAMPLES::GETPOSITIONREQUEST")
  (make-package "DYNAMIXEL_SDK_EXAMPLES::GETPOSITIONREQUEST"))
(unless (find-package "DYNAMIXEL_SDK_EXAMPLES::GETPOSITIONRESPONSE")
  (make-package "DYNAMIXEL_SDK_EXAMPLES::GETPOSITIONRESPONSE"))

(in-package "ROS")





(defclass dynamixel_sdk_examples::GetPositionRequest
  :super ros::object
  :slots (_id ))

(defmethod dynamixel_sdk_examples::GetPositionRequest
  (:init
   (&key
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass dynamixel_sdk_examples::GetPositionResponse
  :super ros::object
  :slots (_position ))

(defmethod dynamixel_sdk_examples::GetPositionResponse
  (:init
   (&key
    ((:position __position) 0)
    )
   (send-super :init)
   (setq _position (round __position))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; int64 _position
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _position
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _position (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _position) (= (length (_position . bv)) 2)) ;; bignum
              (write-long (ash (elt (_position . bv) 0) 0) s)
              (write-long (ash (elt (_position . bv) 1) -1) s))
             ((and (class _position) (= (length (_position . bv)) 1)) ;; big1
              (write-long (elt (_position . bv) 0) s)
              (write-long (if (>= _position 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _position s)(write-long (if (>= _position 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _position
#+(or :alpha :irix6 :x86_64)
      (setf _position (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _position (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass dynamixel_sdk_examples::GetPosition
  :super ros::object
  :slots ())

(setf (get dynamixel_sdk_examples::GetPosition :md5sum-) "0f65f07b4ad30389daa8b9a841b3ec2a")
(setf (get dynamixel_sdk_examples::GetPosition :datatype-) "dynamixel_sdk_examples/GetPosition")
(setf (get dynamixel_sdk_examples::GetPosition :request) dynamixel_sdk_examples::GetPositionRequest)
(setf (get dynamixel_sdk_examples::GetPosition :response) dynamixel_sdk_examples::GetPositionResponse)

(defmethod dynamixel_sdk_examples::GetPositionRequest
  (:response () (instance dynamixel_sdk_examples::GetPositionResponse :init)))

(setf (get dynamixel_sdk_examples::GetPositionRequest :md5sum-) "0f65f07b4ad30389daa8b9a841b3ec2a")
(setf (get dynamixel_sdk_examples::GetPositionRequest :datatype-) "dynamixel_sdk_examples/GetPositionRequest")
(setf (get dynamixel_sdk_examples::GetPositionRequest :definition-)
      "uint8 id
---
int64 position

")

(setf (get dynamixel_sdk_examples::GetPositionResponse :md5sum-) "0f65f07b4ad30389daa8b9a841b3ec2a")
(setf (get dynamixel_sdk_examples::GetPositionResponse :datatype-) "dynamixel_sdk_examples/GetPositionResponse")
(setf (get dynamixel_sdk_examples::GetPositionResponse :definition-)
      "uint8 id
---
int64 position

")



(provide :dynamixel_sdk_examples/GetPosition "0f65f07b4ad30389daa8b9a841b3ec2a")


