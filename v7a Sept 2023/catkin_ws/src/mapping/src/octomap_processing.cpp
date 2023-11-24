#include "octomap_processing.h"
#include <octomap/octomap.h>
#include <octomap/octomap_ros.h>
#include <octomap/OcTree.h>
#include <octomap_ros/conversions.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Imu.h>
#include <nav_msgs/Odometry.h>

using namespace octomap;
using namespace sensor_msgs;
using namespace nav_msgs;
using namespace ros;

Localization::Localization(NodeHandle* nh) {
  // Not 100% sure if the topic is called "imu" or the size of the messages.
  sub = nh_.subscribe("imu", 10, Localization::imuCallback);
}

void processPointCloudToOctomap(const sensor_msgs::PointCloud2& cloudMsg, OcTree* octree) {
    // Check if the OcTree pointer is valid
    if (octree == nullptr) {
        ROS_ERROR("Received null pointer for OcTree.");
        return;
    }
    // If cloudMsgs is empty, don't run the code below
    if (cloudMsg != nullptr) {{
	    // Define the sensor origin (adjust based on actual sensor position)
	    point3d sensorOrigin(0.0f, 0.0f, 0.0f);

	    // Convert PointCloud2 to Octomap::Pointcloud and adds it to the OcTree
	    Pointcloud pc;
	    pointCloud2ToOctomap(cloudMsg, &pc);
	    octree->insertPointCloud(&pc, sensorOrigin);

	    // Update the octree
	    octree->updateInnerOccupancy();	
    }
}
