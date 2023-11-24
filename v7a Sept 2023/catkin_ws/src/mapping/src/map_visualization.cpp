#include "map_visualization.h"
#include <ros/ros.h>
#include <octomap/octomap.h>
#include <octomap/OcTree.h>
#include <octomap_ros/octomap_ros.h>
#include <octomap_msgs/conversions.h>
#include <visualization_msgs/MarkerArray.h>

using namespace octomap;

void visualizeOctomap(ros::NodeHandle& nh, const OcTree& octree) {
    ros::Publisher marker_pub = nh.advertise<visualization_msgs::MarkerArray>("octomap_markers", 1, true);

    visualization_msgs::MarkerArray markers;
    markers.markers.clear();

    // Convert OcTree to MarkerArray
    for(OcTree::tree_iterator it = octree.begin_tree(), end=octree.end_tree(); it!= end; ++it){
        if(octree.isNodeOccupied(*it)){
            double x = it.getX();
            double y = it.getY();
            double z = it.getZ();
            double size = it.getSize();

            visualization_msgs::Marker marker;
            marker.header.frame_id = "map"; // Make sure this is the correct frame
            marker.header.stamp = ros::Time::now();
            marker.ns = "octomap";
            marker.id = it.getDepth();
            marker.type = visualization_msgs::Marker::CUBE;
            marker.action = visualization_msgs::Marker::ADD;
            marker.pose.position.x = x;
            marker.pose.position.y = y;
            marker.pose.position.z = z;
            marker.pose.orientation.w = 1.0;
            marker.scale.x = size;
            marker.scale.y = size;
            marker.scale.z = size;
            marker.color.r = 0.0;
            marker.color.g = 0.0;
            marker.color.b = 1.0;
            marker.color.a = 0.5;
            marker.lifetime = ros::Duration();

            markers.markers.push_back(marker);
        }
    }

    marker_pub.publish(markers);
}
