


HOW TO RUN

# Kinematics Package and Static Stability Checker

## Overview

This project demonstrates the integration and execution of a kinematics package and a static stability checker for robots using the Robot Operating System (ROS). Follow the instructions below to launch the services and monitor the robot's stability status.

## Prerequisites

Before proceeding, ensure you have the following prerequisites met:
- ROS (Melodic, Noetic, or another version compatible with your system) installed.
- The kinematics packge is up and running.
- The Robots Force-Torque Sensors and motors are powered, and have been properly ported into the computer

## Getting Started

### 1. Start ROS Core

First, you need to initiate the ROS master process. Open a new terminal window and run:


Step 1: Start ROS Core
Open a new terminal window and start roscore:
```bash

    roscore

```

Leave this terminal running.

### Step 2: Launch the Visualization
In a new terminal window, launch the visualization using the Transcend_launch package. Make sure to navigate to your ROS workspace directory (if not already there):


```bash


roslaunch Transcend_launch viz.launch

```
This command initiates the kinematics package visualization.


### Step 3: Run the Static Stability Check
Open another terminal window to run the static stability check script:

```bash

roslaunch static_stability stability_check.py

```

This script evaluates the robot's static stability and publishes the status.


### Step 4: Echo the Robot Stability Status
To view the robot's stability status, open a fourth terminal window and subscribe to the /robot/stability_status topic

```bash

rostopic echo /robot/stability_status

```
This command displays the stability status of the robot as published by the stability_check.py script.

## Assumptions Made:

The following assuptions were made:
-   All of the FT sensors and the motors are powered and properly ported.
-   The Robots is in its ideal position
-   Both feet are always in contact.