#ifndef OCTOMAP_PROCESSING_H
#define OCTOMAP_PROCESSING_H

#include <octomap/octomap.h>
#include <octomap/OcTree.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Imu.h>
#include <ros/ros.h>

using namespace ros;

// Class for keeping track of the inert frame of reference of the robot
class Localization {
   NodeHandle* nh_;
   Subscriber sub;
   Publisher pub;

public:
   Localization(NodeHandle* nh) : nh_(nh);
   // When getting a message from the imu topic, this code will run.
   imuCallback(const sensor_msgs::Imu);
}

// Process the PointCloud2 data into a format compatible with Octomap and adds to OcTree provided by the user.
void processPointCloudToOctomap(const sensor_msgs::PointCloud2& cloudMsg, octomap::OcTree* octree);

#endif
