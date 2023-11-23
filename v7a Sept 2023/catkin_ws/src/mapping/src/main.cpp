#include "ros/ros.h"
#include "ros_communication.h"

int main(int argc, char **argv) {
    ros::init(argc, argv, "octomap_node");

    ros::NodeHandle nh;
    setupRosCommunication(nh);

    ros::spin(); // Keep the node running

    return 0;
}