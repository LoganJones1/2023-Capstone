; Auto-generated. Do not edit!


(cl:in-package dynamixel_sdk_examples-srv)


;//! \htmlinclude GetMotorSensors-request.msg.html

(cl:defclass <GetMotorSensors-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GetMotorSensors-request (<GetMotorSensors-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMotorSensors-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMotorSensors-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_sdk_examples-srv:<GetMotorSensors-request> is deprecated: use dynamixel_sdk_examples-srv:GetMotorSensors-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <GetMotorSensors-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_sdk_examples-srv:id-val is deprecated.  Use dynamixel_sdk_examples-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMotorSensors-request>) ostream)
  "Serializes a message object of type '<GetMotorSensors-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMotorSensors-request>) istream)
  "Deserializes a message object of type '<GetMotorSensors-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMotorSensors-request>)))
  "Returns string type for a service object of type '<GetMotorSensors-request>"
  "dynamixel_sdk_examples/GetMotorSensorsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMotorSensors-request)))
  "Returns string type for a service object of type 'GetMotorSensors-request"
  "dynamixel_sdk_examples/GetMotorSensorsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMotorSensors-request>)))
  "Returns md5sum for a message object of type '<GetMotorSensors-request>"
  "9d09fdbf53e24d372145a4f9997470e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMotorSensors-request)))
  "Returns md5sum for a message object of type 'GetMotorSensors-request"
  "9d09fdbf53e24d372145a4f9997470e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMotorSensors-request>)))
  "Returns full string definition for message of type '<GetMotorSensors-request>"
  (cl:format cl:nil "uint8 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMotorSensors-request)))
  "Returns full string definition for message of type 'GetMotorSensors-request"
  (cl:format cl:nil "uint8 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMotorSensors-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMotorSensors-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMotorSensors-request
    (cl:cons ':id (id msg))
))
;//! \htmlinclude GetMotorSensors-response.msg.html

(cl:defclass <GetMotorSensors-response> (roslisp-msg-protocol:ros-message)
  ((current
    :reader current
    :initarg :current
    :type cl:integer
    :initform 0)
   (voltage
    :reader voltage
    :initarg :voltage
    :type cl:integer
    :initform 0)
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:integer
    :initform 0))
)

(cl:defclass GetMotorSensors-response (<GetMotorSensors-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMotorSensors-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMotorSensors-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_sdk_examples-srv:<GetMotorSensors-response> is deprecated: use dynamixel_sdk_examples-srv:GetMotorSensors-response instead.")))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <GetMotorSensors-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_sdk_examples-srv:current-val is deprecated.  Use dynamixel_sdk_examples-srv:current instead.")
  (current m))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <GetMotorSensors-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_sdk_examples-srv:voltage-val is deprecated.  Use dynamixel_sdk_examples-srv:voltage instead.")
  (voltage m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <GetMotorSensors-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_sdk_examples-srv:temperature-val is deprecated.  Use dynamixel_sdk_examples-srv:temperature instead.")
  (temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMotorSensors-response>) ostream)
  "Serializes a message object of type '<GetMotorSensors-response>"
  (cl:let* ((signed (cl:slot-value msg 'current)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'voltage)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'temperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMotorSensors-response>) istream)
  "Deserializes a message object of type '<GetMotorSensors-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'voltage) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'temperature) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMotorSensors-response>)))
  "Returns string type for a service object of type '<GetMotorSensors-response>"
  "dynamixel_sdk_examples/GetMotorSensorsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMotorSensors-response)))
  "Returns string type for a service object of type 'GetMotorSensors-response"
  "dynamixel_sdk_examples/GetMotorSensorsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMotorSensors-response>)))
  "Returns md5sum for a message object of type '<GetMotorSensors-response>"
  "9d09fdbf53e24d372145a4f9997470e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMotorSensors-response)))
  "Returns md5sum for a message object of type 'GetMotorSensors-response"
  "9d09fdbf53e24d372145a4f9997470e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMotorSensors-response>)))
  "Returns full string definition for message of type '<GetMotorSensors-response>"
  (cl:format cl:nil "int32 current~%int32 voltage~%int32 temperature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMotorSensors-response)))
  "Returns full string definition for message of type 'GetMotorSensors-response"
  (cl:format cl:nil "int32 current~%int32 voltage~%int32 temperature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMotorSensors-response>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMotorSensors-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMotorSensors-response
    (cl:cons ':current (current msg))
    (cl:cons ':voltage (voltage msg))
    (cl:cons ':temperature (temperature msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetMotorSensors)))
  'GetMotorSensors-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetMotorSensors)))
  'GetMotorSensors-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMotorSensors)))
  "Returns string type for a service object of type '<GetMotorSensors>"
  "dynamixel_sdk_examples/GetMotorSensors")