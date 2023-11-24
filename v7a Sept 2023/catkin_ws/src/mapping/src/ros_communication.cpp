#include "ros_communication.h"
#include "octomap_processing.h"
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <octomap_msgs/Octomap.h>
#include <octomap_msgs/conversions.h>
#include <memory>

using namespace ros;
using namespace sensor_msgs;
using namespace octomap;

class OctomapConverter {
private:
    NodeHandle n;
    Subscriber sub;
    Publisher pub;
    OcTree* octree;

public:
    OctomapConverter() {
        octree = new OcTree(1);  // Initialize the OcTree with a resolution (e.g., 1 meter)
        sub = n.subscribe("velodyne_points", 10, &OctomapConverter::pointCloudCallback, this);
        pub = n.advertise<octomap_msgs::Octomap>("octomap_topic", 10);  // Publishing OctoMap data
    }

    ~OctomapConverter() {
        delete octree;  // Properly deallocate memory
    }

    void pointCloudCallback(const PointCloud2& cloudMsg) {
        processPointCloudToOctomap(cloudMsg, octree);

        // Convert OcTree to a ROS message and publish it
        octomap_msgs::Octomap octomapMsg;
        octomapMsg.header.stamp = ros::Time::now();
        octomapMsg.header.frame_id = "map";  // Set the appropriate frame id
        octomapMsg.binary = true;  // OctoMap messages are sent in binary form usually
        octomapMsg.id = OcTree()->getTreeType().c_str();
        octomapMsg.resolution = octree->getResolution();
        octomapMsg.data = std::vector<int8_t>();
        octomap::fullMsgData(*octree, octomapMsg.data);
        pub.publish(octomapMsg);
    }
};

void setupRosCommunication(NodeHandle& nh) {
    std::shared_ptr<OctomapConverter> converter = std::make_shared<OctomapConverter>();
    // ROS subscriber and publisher are managed within the OctomapConverter instance
}
