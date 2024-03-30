#!/usr/bin/env python3


# File: stability_check.py
# Author: Logan Jones
# Date: March 13, 2024
# Description: To check if the robot is stable in a static possition and send 
# a message on ros whether the robot is stable or not.

# Imports
import rospy
from std_msgs.msg import Bool
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Vector3
#from sensor_msgs.msg import ForceTorqueSensorMessageType # Toshi, update this
from geometry_msgs.msg import Vector3
from dynamixel_sdk import *  # Assumes Dynamixel SDK library is correctly set up and accessible
import tf.transformations
from dynamixel_sdk import PortHandler, PacketHandler
from geometry_msgs.msg import WrenchStamped
import numpy as np
import matplotlib.pyplot as plt
from geometry_msgs.msg import PoseStamped

# Constants
IMU_TOPIC = "imu/data"
FORCE_TORQUE_TOPIC = "" # Toshi, update this
STABILITY_STATUS_TOPIC = "robot/stability_status"
# DYNAMIXEL_MOTOR_IDS = [1, 2, 3, 4]  #update
# DEVICENAME = '/dev/ttyUSB0'
# BAUDRATE = 57600
# PROTOCOL_VERSION = 2.0
ADDR_PRESENT_POSITION = 123  #update
KIN_LARM_TOPIC = "FKinematics_LARM"
KIN_LLEG_TOPIC = "FKinematics_LLEG"
KIN_RARM_TOPIC = "FKinematics_RARM"
KIN_RLEG_TOPIC = "FKinematics_RLEG"

# Global Variables
vecGravity = Vector3()
ftData = {}
fx_lwr = 0
fy_lwr = 0
fz_lwr = 0
tx_lwr = 0
ty_lwr = 0
tz_lwr = 0
fx_rwr = 0
fy_rwr = 0
fz_rwr = 0
tx_rwr = 0
ty_rwr = 0
tz_rwr = 0
fx_ll = 0
fy_ll = 0
fz_ll = 0
tx_ll = 0
ty_ll = 0
tz_ll = 0
sensors_visu = [0,0,0,0,0]

dataLARM = {}
dataLLEG = {}
dataRARM = {}
dataRLEG = {}


# Setup
# portHandler = PortHandler(DEVICENAME)
# packetHandler = PacketHandler(PROTOCOL_VERSION)
# if not portHandler.openPort():
#     rospy.logerr("Failed to open the port")
#     exit()
# if not portHandler.setBaudRate(BAUDRATE):
#     rospy.logerr("Failed to set the baud rate")
#     exit()


# Functions
    
#callback for force readings published by left wrist sensor

def wrench_callback_lwr(msg_lwr):
    global fx_lwr, fy_lwr, fz_lwr, tx_lwr, ty_lwr, tz_lwr
	#print("**********LEFT WRIST**********")
    fx_lwr = msg_lwr.wrench.force.x
    fy_lwr = msg_lwr.wrench.force.y
    fz_lwr = msg_lwr.wrench.force.z
    tx_lwr = msg_lwr.wrench.torque.x
    ty_lwr = msg_lwr.wrench.torque.y
    tz_lwr = msg_lwr.wrench.torque.z

#****************************************************************************************

	
#callback for force readings published by right wrrist sensor

def wrench_callback_rwr(msg_rwr):
    global fx_rwr, fy_rwr, fz_rwr, tx_rwr, ty_rwr, tz_rwr
    fx_rwr = msg_rwr.wrench.force.x
    fy_rwr = msg_rwr.wrench.force.y
    fz_rwr = msg_rwr.wrench.force.z
    tx_rwr = msg_rwr.wrench.torque.x
    ty_rwr = msg_rwr.wrench.torque.y
    tz_rwr = msg_rwr.wrench.torque.z

#*****************************************************************************************************

#callback function for readings published by left leg sensor

def wrench_callback_ll(msg_ll):
    global fx_ll, fy_ll, fz_ll, tx_ll, ty_ll, tz_ll
    fx_ll = msg_ll.wrench.force.x
    fy_ll = msg_ll.wrench.force.y
    fz_ll = msg_ll.wrench.force.z
    tx_ll = msg_ll.wrench.torque.x
    ty_ll = msg_ll.wrench.torque.y
    tz_ll = msg_ll.wrench.torque.z

#***************************************************************************************

# callback function for right leg sensor

def wrench_callback_rl(msg_rl):
    global fx_lwr, fy_lwr, fz_lwr, tx_lwr, ty_lwr, tz_lwr
	#print("**********LEFT WRIST**********")
    fx_lwr = msg_rl.wrench.force.x
    fy_lwr = msg_rl.wrench.force.y
    fz_lwr = msg_rl.wrench.force.z
    tx_lwr = msg_rl.wrench.torque.x
    ty_lwr = msg_rl.wrench.torque.y
    tz_lwr = msg_rl.wrench.torque.z
	
#****************************************************************************************



# LOAD ENDPOINT VECTORS
# ASSIGNEE: Logan Jones
# ---------------------
# Subscribe to the ros topic that contains vectors from the center of mass
# to the end of each limb (Left hand and foot, right hand and foot).
def larm_callback(data):
    dataLARM = data

def llrg_callback(data):
    dataLLEG = data

def rarm_callback(data):
    dataRARM = data

def rleg_callback(data):
    dataRLEG = data

def processXY(num):
    return num / 100.00 # convert cm to m

def processZ(num):
    return (num - 120.00) / 100.00  # translate to pelvis frame of reference
                                    # and conver cm to m

def load_endpoint_vectors():
    la_vec = Vector3(processXY(dataLARM.pose.position.x),
                     processXY(dataLARM.pose.position.y),
                      processZ(dataLARM.pose.position.z))
    ll_vec = Vector3(processXY(dataLLEG.pose.position.x),
                     processXY(dataLLEG.pose.position.y),
                      processZ(dataLLEG.pose.position.z))
    ra_vec = Vector3(processXY(dataRARM.pose.position.x),
                     processXY(dataRARM.pose.position.y),
                      processZ(dataRARM.pose.position.z))
    rl_vec = Vector3(processXY(dataRLEG.pose.position.x),
                     processXY(dataRLEG.pose.position.y),
                      processZ(dataRLEG.pose.position.z))

    endPointVecs = {'leftHand': la_vec,
                    'rightHand': ra_vec,
                    'leftFoot': ll_vec,
                    'rightFoot': rl_vec}
    return endPointVecs
# End of: LOAD ENDPOINT VECTORS


# LOAD FORCE-TORQUE SENSOR DATA
# ASSIGNEE: Toshi Baswas
# -----------------------------
# Subscribe to the ros topic that contains values from the force-torque
# sensors and calculate wether that limb is in contact for stability.
def force_torque_callback(data):
    ftData = data

def load_ft_data():
    global ftData

    rospy.init_node('register')

    publisher = rospy.Publisher('/visualization_marker_array', MarkerArray, queue_size=10)

    rospy.Subscriber("/bus0/ft_sensor0/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_lwr)
    rospy.Subscriber("/bus1/ft_sensor1/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_rwr)
    rospy.Subscriber("/bus2/ft_sensor2/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_ll)
    rospy.Subscriber("/bus3/ft_sensor3/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_rl)
    limbsInContact = {'leftHand': False, 'rightHand': False,    # mock data
                      'leftFoot': False, 'rightFoot': False}    # needs updating
    return limbsInContact
# End of: LOAD FORCE-TORQUE SENSOR DATA


# UPDATE GRAVITY VECTOR
# ASSIGNEE: Logan Jones
# ---------------------
# Load information from the IMU to find the direction of gravity. Create a
# vector to represent the direction of gravity from the center of mass of
# the robot.
def imu_callback(data):
    global vecGravity
    x = data.linear_acceleration.x
    y = -(data.linear_acceleration.y) # rotated 180 about the x axis
    z = -(data.linear_acceleration.z) # rotated 180 about the x axis
    vecGravity = Vector3(x,y,z)
# End of: UPDATE GRAVITY VECTOR


# CALCULATE CONTACT POINTS
# ASSIGNEE: Aryan Taneja
# ------------------------
# Calculate the points of the robot that are in contact for stability. The 
# contact points should be vectors that originate from the center of mass.
def calc_contact_points(endPointVecs, limbsInContact):
       # MOCK DATA : presume the contact points make a square
    active_points = []
    for limb, isInContact in limbsInContact.items():
        if isInContact:
            # If the limb is in contact, append its associated point to active_points
            active_points.append(endPointVecs[limb])
    contactPoints=np.array(active_points) 
    return contactPoints
# End of: CALCULATE CONTACT POINTS


# CALCULATE POLYGON
# ASSIGNEE: Aryan Taneja
# ----------------------
# Calculate the stabilty poligon that is the largest possible triangle from
# considering all contact points.
def calc_polygon(contactPoints):
    if len(contactPoints) > 2:
        # If yes, return the contactPoints as they are
        return contactPoints
    if len(contactPoints) == 2:
        # Create a new point by adding 0.07 to the x value of the first point
        new_first_point = Vector3(contactPoints[0].x + 0.07, contactPoints[0].y, contactPoints[0].z)
        # Create another new point by subtracting 0.07 from the x value of the first point
        new_second_point = Vector3(contactPoints[0].x - 0.07, contactPoints[0].y, contactPoints[0].z)

        # Update the list: new_first_point becomes the first, new_second_point becomes the second,
        # and the initial second element is now the third
        contactPoints = [new_first_point, new_second_point] + contactPoints[1:]
        cws = np.array([contactPoints])    # List of the three contact points that make up the support poligon
        return cws
    
    
# End of: CALCULATE POLYGON


# CALCULATE STABILITY
# ASSIGNEE: Francis Nacu
# ----------------------
# Calculate whether the center of mass (gravity vector) itersects with the
# support polygon.
def is_stable(cws):
    # should be replaced with something more thorough
    polygon_points = np.array(cws)[:, :2]  # extract x y coordinates
    gravity_point = vecGravity[:2]  # Ignoring Z coordinate
    stable = plt.path.Path(polygon_points).contains_point(gravity_point)    # boolean
    return stable
# End of: CALCULATE STABILITY


# Main code
if __name__ == "__main__":
    # establish ros node
    rospy.init_node('static_stability_check')

    # setup sub and pub topics
    rospy.Subscriber(IMU_TOPIC, Imu, imu_callback)
    rospy.Subscriber(KIN_LARM_TOPIC, PoseStamped, larm_callback)
    rospy.Subscriber(KIN_LLEG_TOPIC, PoseStamped, llrg_callback)
    rospy.Subscriber(KIN_RARM_TOPIC, PoseStamped, rarm_callback)
    rospy.Subscriber(KIN_RLEG_TOPIC, PoseStamped, rleg_callback)
    # rospy.Subscriber(FORCE_TORQUE_TOPIC, ForceTorqueSensorMessageType, force_torque_callback)
    stability_pub = rospy.Publisher(STABILITY_STATUS_TOPIC, Bool, queue_size=10)

    # loop functionality
    rate = rospy.Rate(10)  # 10 Hz
    while not rospy.is_shutdown():

        # load data from topics/sensors
        endPontVecs = load_endpoint_vectors()
        limbsInContact = load_ft_data()

        # calculate stability
        contactPoints = calc_contact_points(endPontVecs, limbsInContact)
        cws = calc_polygon(contactPoints)
        stable = is_stable(cws)

        # publish stability
        # Toshi, this covers one of your responsibilities
        stability_pub.publish(Bool(stable))

        # sleep
        rate.sleep()

    # end of file