"""
File: stability_check.py
Author: Logan Jones
Date: February 26, 2024

Description: To check if the robot is stable in a static possition and send 
a message on ros wether the robot is stable or not.
"""

# Imports
# Add import statements here if needed

# Constants
# Add any global constants here

# Functions
# Define your functions here

# Main code
if __name__ == "__main__":
    
    """
    LOAD ENDPOINT VECTORS
    ---------------------
    Subscribe to the ros topic that contains vectors from the center of mass
    to the end of each limb (Left hand and foot, right hand and foot).
    """
    vecLeftHand = []    # a vector
    vecRightHand = []   # a vector
    vecLeftFoot = []    # a vector
    vecRightFoot = []   # a vector
    # End of: LOAD ENDPOINT VECTORS

    """
    LOAD FORCE-TORQUE SENSOR DATA
    -----------------------------
    Subscribe to the ros topic that contains values from the force-torque
    sensors and calculate wether that limb is in contact for stability.
    """
    contactLeftHand = 0     # a boolean
    contactRightHand = 0    # a boolean
    contactLeftFoot = 0     # a boolean
    contactRightFoot = 0    # a boolean
    # End of: LOAD FORCE-TORQUE SENSOR DATA

    """
    LOAD THE DIRECTION OF GRAVITY
    -----------------------------
    Load information from the IMU to find the direction of gravity. Create a
    vector to represent the direction of gravity from the center of mass of
    the robot.
    """
    vecGravity = []   # a vector
    # End of: CALCULATE CONTACT POINTS

    """
    CALCULATE CONTACT POINTS
    ------------------------
    Calculate the points of the robot that are in contact for stability. The 
    contact points should be vectors that originate from the center of mass.
    """
    contactPoints = []  # an array/list of vectors
    # End of: CALCULATE CONTACT POINTS