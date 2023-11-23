#ifndef OCTOMAP_PROCESSING_H
#define OCTOMAP_PROCESSING_H

#include <octomap/octomap.h>
#include <octomap/OcTree.h>
#include <sensor_msgs/PointCloud2.h>

void processPointCloudToOctomap(const sensor_msgs::PointCloud2& cloudMsg, octomap::OcTree* octree);

#endif