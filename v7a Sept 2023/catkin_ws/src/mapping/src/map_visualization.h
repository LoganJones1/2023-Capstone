#ifndef MAP_VISUALIZATION_H
#define MAP_VISUALIZATION_H

#include <ros/ros.h>
#include <octomap/OcTree.h>

void visualizeOctomap(ros::NodeHandle& nh, const octomap::OcTree& octree);

#endif 
