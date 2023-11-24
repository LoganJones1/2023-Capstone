#ifndef ROS_COMMUNICATION_H
#define ROS_COMMUNICATION_H

#include "ros/ros.h"
#include <octomap/OcTree.h>
#include <sensor_msgs/PointCloud2.h>

class OctomapConverter {
public:
    OctomapConverter();
    ~OctomapConverter();

private:
    void pointCloudCallback(const sensor_msgs::PointCloud2& cloudMsg);

    ros::NodeHandle n;
    ros::Subscriber sub;
    ros::Publisher pub;
    octomap::OcTree* octree;
};

void setupRosCommunication(ros::NodeHandle& nh);

#endif
