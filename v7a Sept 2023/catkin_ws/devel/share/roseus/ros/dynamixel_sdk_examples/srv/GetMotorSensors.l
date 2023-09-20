;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_sdk_examples::GetMotorSensors)
  (if (not (find-package "DYNAMIXEL_SDK_EXAMPLES"))
    (make-package "DYNAMIXEL_SDK_EXAMPLES"))
  (shadow 'GetMotorSensors (find-package "DYNAMIXEL_SDK_EXAMPLES")))
(unless (find-package "DYNAMIXEL_SDK_EXAMPLES::GETMOTORSENSORS")
  (make-package "DYNAMIXEL_SDK_EXAMPLES::GETMOTORSENSORS"))
(unless (find-package "DYNAMIXEL_SDK_EXAMPLES::GETMOTORSENSORSREQUEST")
  (make-package "DYNAMIXEL_SDK_EXAMPLES::GETMOTORSENSORSREQUEST"))
(unless (find-package "DYNAMIXEL_SDK_EXAMPLES::GETMOTORSENSORSRESPONSE")
  (make-package "DYNAMIXEL_SDK_EXAMPLES::GETMOTORSENSORSRESPONSE"))

(in-package "ROS")





(defclass dynamixel_sdk_examples::GetMotorSensorsRequest
  :super ros::object
  :slots (_id ))

(defmethod dynamixel_sdk_examples::GetMotorSensorsRequest
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

(defclass dynamixel_sdk_examples::GetMotorSensorsResponse
  :super ros::object
  :slots (_current _voltage _temperature ))

(defmethod dynamixel_sdk_examples::GetMotorSensorsResponse
  (:init
   (&key
    ((:current __current) 0)
    ((:voltage __voltage) 0)
    ((:temperature __temperature) 0)
    )
   (send-super :init)
   (setq _current (round __current))
   (setq _voltage (round __voltage))
   (setq _temperature (round __temperature))
   self)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; int32 _current
    4
    ;; int32 _voltage
    4
    ;; int32 _temperature
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _current
       (write-long _current s)
     ;; int32 _voltage
       (write-long _voltage s)
     ;; int32 _temperature
       (write-long _temperature s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _current
     (setq _current (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _voltage
     (setq _voltage (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _temperature
     (setq _temperature (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass dynamixel_sdk_examples::GetMotorSensors
  :super ros::object
  :slots ())

(setf (get dynamixel_sdk_examples::GetMotorSensors :md5sum-) "9d09fdbf53e24d372145a4f9997470e8")
(setf (get dynamixel_sdk_examples::GetMotorSensors :datatype-) "dynamixel_sdk_examples/GetMotorSensors")
(setf (get dynamixel_sdk_examples::GetMotorSensors :request) dynamixel_sdk_examples::GetMotorSensorsRequest)
(setf (get dynamixel_sdk_examples::GetMotorSensors :response) dynamixel_sdk_examples::GetMotorSensorsResponse)

(defmethod dynamixel_sdk_examples::GetMotorSensorsRequest
  (:response () (instance dynamixel_sdk_examples::GetMotorSensorsResponse :init)))

(setf (get dynamixel_sdk_examples::GetMotorSensorsRequest :md5sum-) "9d09fdbf53e24d372145a4f9997470e8")
(setf (get dynamixel_sdk_examples::GetMotorSensorsRequest :datatype-) "dynamixel_sdk_examples/GetMotorSensorsRequest")
(setf (get dynamixel_sdk_examples::GetMotorSensorsRequest :definition-)
      "uint8 id
---
int32 current
int32 voltage
int32 temperature

")

(setf (get dynamixel_sdk_examples::GetMotorSensorsResponse :md5sum-) "9d09fdbf53e24d372145a4f9997470e8")
(setf (get dynamixel_sdk_examples::GetMotorSensorsResponse :datatype-) "dynamixel_sdk_examples/GetMotorSensorsResponse")
(setf (get dynamixel_sdk_examples::GetMotorSensorsResponse :definition-)
      "uint8 id
---
int32 current
int32 voltage
int32 temperature

")



(provide :dynamixel_sdk_examples/GetMotorSensors "9d09fdbf53e24d372145a4f9997470e8")


