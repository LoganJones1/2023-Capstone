#include "octomap_processing.h"
#include <octomap/octomap.h>
#include <octomap/OcTree.h>
#include <octomap_ros/conversions.h>
#include <sensor_msgs/PointCloud2.h>

using namespace octomap;
using namespace sensor_msgs;


void processPointCloudToOctomap(const sensor_msgs::PointCloud2& cloudMsg, OcTree* octree) {
    // Check if the OcTree pointer is valid
    if (!octree) {
        ROS_ERROR("Received null pointer for OcTree.");
        return;
    }

    // TODO: Pair 1 to implement conversion of ROS PointCloud2 to PCL PointCloud

    // TODO: Pair 1 to implement conversion of PCL PointCloud to Octomap Pointcloud

    // Define the sensor origin (adjust based on actual sensor position)
    point3d sensorOrigin(0, 0, 0);

    // TODO: Pair 1 to insert the point cloud into the octree

    // Update the octree
    octree->updateInnerOccupancy();
}