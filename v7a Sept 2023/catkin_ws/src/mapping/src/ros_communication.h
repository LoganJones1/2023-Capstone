#ifndef ROS_COMMUNICATION_H
#define ROS_COMMUNICATION_H

#include "ros/ros.h"
#include <memory>

class OctomapConverter;

void setupRosCommunication(ros::NodeHandle& nh);

#endif