#!/usr/bin/env python3


# File: stability_check.py
# Author: Logan Jones
# Date: March 13, 2024
# Description: To check if the robot is stable in a static possition and send 
# a message on ros wether the robot is stable or not.

# Imports
import scipy.stats as stats
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
from geometry_msgs.msg import Point
import numpy as np
import matplotlib.pyplot as plt
import math

# Constants
IMU_TOPIC = "imu/data"
FORCE_TORQUE_TOPIC = "" # Toshi, update this
STABILITY_STATUS_TOPIC = "robot/stability_status"
# DYNAMIXEL_MOTOR_IDS = [1, 2, 3, 4]  #update
# DEVICENAME = '/dev/ttyUSB0'
# BAUDRATE = 57600
# PROTOCOL_VERSION = 2.0
ADDR_PRESENT_POSITION = 123  #update


# Global Variables
vecGravity = Vector3()
reads = 100000                         #number of times our code will read the ft data 
gaussianCreated = False
location = 0
ftData = np.zeros((2),dtype = float)
sensors_visu = [0,0,0,0,0]
""" 
The variable confidence_level considers the level of confidence there is for intervals. 
this needs to be between 0 and 1. the closer to 0, the lower the bounds will be
the closer to 1, the bigger the bounds will be. adjust the confidence level accordingly
"""
confidence_level = 0.95                
flwrUpper = 0.0
flwrLower = 0.0
tlwrUpper = 0.0
tlwrLower = 0.0

frwrUpper = 0.0
frwrLower = 0.0
trwrUpper = 0.0
trwrLower = 0.0

fllUpper = 0.0
fllLower = 0.0
tllUpper = 0.0
tllLower = 0.0

frlUpper = 0.0
frlLower = 0.0
trlUpper = 0.0
trlLower = 0.0


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
	#print("**********LEFT WRIST**********")
    global ftData
    fx = msg_lwr.wrench.force.x
    fy = msg_lwr.wrench.force.y
    fz = msg_lwr.wrench.force.z
    tx = msg_lwr.wrench.torque.x
    ty = msg_lwr.wrench.torque.y
    tz = msg_lwr.wrench.torque.z
    ftData[0] = math.sqrt(fx*fx + fy*fy + fz*fz)
    ftData[1] = math.sqrt(tx*tx + ty*ty + tz*tz)
#****************************************************************************************

	
#callback for force readings published by right wrrist sensor

def wrench_callback_rwr(msg_rwr):
    global ftData
    fx = msg_rwr.wrench.force.x
    fy = msg_rwr.wrench.force.y
    fz = msg_rwr.wrench.force.z
    tx = msg_rwr.wrench.torque.x
    ty = msg_rwr.wrench.torque.y
    tz = msg_rwr.wrench.torque.z
    ftData[0] = math.sqrt(fx*fx + fy*fy + fz*fz)
    ftData[1] = math.sqrt(tx*tx + ty*ty + tz*tz)

#*****************************************************************************************************

#callback function for readings published by left leg sensor

def wrench_callback_ll(msg_ll):
    global ftData

    fx = msg_ll.wrench.force.x
    fy = msg_ll.wrench.force.y
    fz = msg_ll.wrench.force.z
    tx = msg_ll.wrench.torque.x
    ty = msg_ll.wrench.torque.y
    tz = msg_ll.wrench.torque.z
    ftData[0] = math.sqrt(fx*fx + fy*fy + fz*fz)
    ftData[1] = math.sqrt(tx*tx + ty*ty + tz*tz)

#***************************************************************************************

# callback function for right leg sensor

def wrench_callback_rl(msg_rl):
    global ftData
	#print("**********LEFT WRIST**********")
    fx = msg_rl.wrench.force.x
    fy = msg_rl.wrench.force.y
    fz = msg_rl.wrench.force.z
    tx = msg_rl.wrench.torque.x
    ty = msg_rl.wrench.torque.y
    tz = msg_rl.wrench.torque.z
    ftData[0] = math.sqrt(fx*fx + fy*fy + fz*fz)
    ftData[1] = math.sqrt(tx*tx + ty*ty + tz*tz)

	
#****************************************************************************************



# LOAD ENDPOINT VECTORS (Incomplete)
# ASSIGNEE: Logan Jones
# ---------------------
# Subscribe to the ros topic that contains vectors from the center of mass
# to the end of each limb (Left hand and foot, right hand and foot).
def load_endpoint_vectors():
    # NEED TO BE DONE WHEN KINIMATICS ARE COMPLETED:
    # 1) Subscribe to the kinimatics topic to recieve 4 vectors that represent the
    # locations of the end of each limb and originate form the robot's center of
    # mass.
    # 2) Load those vectors into the following dictionary in place of the existing
    # mock data.
    endPointVecs = {'leftHand': Vector3(0.0, 2.0, 1.0),
                    'rightHand': Vector3(-1.0,-2.0, 1.0),
                    'leftFoot': Vector3(1.5, 0.5,-3.0),
                    'rightFoot': Vector3(-0.5,-1.0,-3.0)}
    return endPointVecs
# End of: LOAD ENDPOINT VECTORS
"""
Confidence interval
ASSIGNEE: Toshi Baswas
-----------------------------
gives us the upper and lower bounds of a distribution when we get 
"""
def confidence_interval(mean, std_dev, sample_size, z_score):
    # Calculate the margin of error
    margin_of_error = z_score * (std_dev / np.sqrt(sample_size))
    
    # Calculate the lower and upper bounds
    lower_bound = mean - margin_of_error
    upper_bound = mean + margin_of_error
    
    return lower_bound, upper_bound
"""
START UP CALC
ASSIGNEE: Toshi Baswas
-----------------------------
Subscribe to the ros topic that contains values from the force-torque
sensors and do the idle readings that will give us the gaussian distribution we need
"""


def startupCalc():
    global flwrLower, flwrUpper, tlwrLower, tlwrUpper, frwrLower, frwrUpper, trwrLower, trwrUpper, fllLower, fllUpper, tllLower, tllUpper, frlLower, frlUpper, trlLower, trlUpper
    z_score = stats.norm.ppf(1 - (1 - confidence_level) / 2)  # for a normal distribution
    rospy.init_node('register')
    
    ftRecordings = np.zeros((reads,2),dtype=float)
    for i in reads:
        rospy.Subscriber("/bus0/ft_sensor0/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_lwr)
        ftRecordings[i,0] = ftData[0]
        ftRecordings[i,1] = ftData[1]
    flwrLower, flwrUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[0], np.std(ftRecordings,axis = 0)[0], reads, z_score)
    tlwrLower, tlwrUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[1], np.std(ftRecordings,axis = 0)[1], reads, z_score)
    
    for i in reads:
        rospy.Subscriber("/bus1/ft_sensor1/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_rwr)
        ftRecordings[i,0] = ftData[0]
        ftRecordings[i,1] = ftData[1]
    frwrLower, frwrUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[0], np.std(ftRecordings,axis = 0)[0], reads, z_score)
    trwrLower, trwrUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[1], np.std(ftRecordings,axis = 0)[1], reads, z_score)

    for i in reads:
        rospy.Subscriber("/bus2/ft_sensor2/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_ll)
        ftRecordings[i,0] = ftData[0]
        ftRecordings[i,1] = ftData[1]
    fllLower, fllUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[0], np.std(ftRecordings,axis = 0)[0], reads, z_score)
    tllLower, tllUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[1], np.std(ftRecordings,axis = 0)[1], reads, z_score)

    for i in reads:
        rospy.Subscriber("/bus3/ft_sensor3/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_rl)
        ftRecordings[i,0] = ftData[0]
        ftRecordings[i,1] = ftData[1]
    frlLower, frlUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[0], np.std(ftRecordings,axis = 0)[0], reads, z_score)
    trlLower, trlUpper = confidence_interval(np.mean(ftRecordings,axis = 0)[1], np.std(ftRecordings,axis = 0)[1], reads, z_score)


"""
LOAD FORCE-TORQUE SENSOR DATA
ASSIGNEE: Toshi Baswas
-----------------------------
Subscribe to the ros topic that contains values from the force-torque
sensors and calculate wether that limb is in contact for stability.
"""
def load_ft_data():
    rospy.init_node('register')
    is_in_contact = [False,False,False,False]
    rospy.Subscriber("/bus0/ft_sensor0/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_lwr)
    if(not(ftData[0] >= flwrLower and ftData[0]<=flwrUpper and ftData[1] >= tlwrLower and ftData[1]<=tlwrUpper)):
        is_in_contact[0] = True
    rospy.Subscriber("/bus1/ft_sensor1/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_rwr)
    if(not(ftData[0] >= frwrLower and ftData[0]<=frwrUpper and ftData[1] >= trwrLower and ftData[1]<=trwrUpper)):
        is_in_contact[1] = True
    rospy.Subscriber("/bus2/ft_sensor2/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_ll)
    if(not(ftData[0] >= fllLower and ftData[0]<=fllUpper and ftData[1] >= tllLower and ftData[1]<=tllUpper)):
        is_in_contact[2] = True
    rospy.Subscriber("/bus3/ft_sensor3/ft_sensor_readings/wrench", WrenchStamped, wrench_callback_rl)
    if(not(ftData[0] >= frlLower and ftData[0]<=frlUpper and ftData[1] >= trlLower and ftData[1]<=trlUpper) ):
        is_in_contact[3] = True
    return is_in_contact
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
    y = -(data.linear_acceleration.y)
    z = -(data.linear_acceleration.z)
    vecGravity = Vector3(x,y,z)
# End of: UPDATE GRAVITY VECTOR


# CALCULATE CONTACT POINTS
# ASSIGNEE: Aryan Taneja
# ------------------------
# Calculate the points of the robot that are in contact for stability. The 
# contact points should be vectors that originate from the center of mass.
def calc_contact_points(endPointVecs, limbsInContact):
    # ADD CODE HERE
    contactPoints = np.array([])  # an array/list of vectors
    return contactPoints
# End of: CALCULATE CONTACT POINTS


# CALCULATE POLYGON
# ASSIGNEE: Aryan Taneja
# ----------------------
# Calculate the stabilty poligon that is the largest possible triangle from
# considering all contact points.
def calc_polygon(contactPoints):
    # ADD CODE HERE
    cws = np.array([])    # List of the three contact points that make up the support poligon
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
    # rospy.Subscriber(FORCE_TORQUE_TOPIC, ForceTorqueSensorMessageType, force_torque_callback)
    stability_pub = rospy.Publisher(STABILITY_STATUS_TOPIC, Bool, queue_size=10)

    # loop functionality
    rate = rospy.Rate(10)  # 10 Hz

    # calculate the gaussian distribution that gives us our upper and lower limits, which will be used to calculate the amount of limbs in contact
    startupCalc()
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