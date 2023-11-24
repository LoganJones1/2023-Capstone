#include "ros/ros.h"
#include "ros_communication.h"
#include "map_visualization.h"

int main(int argc, char **argv) {
    ros::init(argc, argv, "octomap_node");

    ros::NodeHandle nh;
    setupRosCommunication(nh);

    octomap::OcTree octree(0.1); // OcTree initialization
    visualizeOctomap(nh, octree); // Call the visualization function

    ros::spin(); // Keep the node running

    return 0;
}
