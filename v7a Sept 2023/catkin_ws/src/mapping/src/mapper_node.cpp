#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Imu.h> // RYAN: Vectornav packages automatically convert sensor data to this Imu message format
#include <geometry_msgs/Vector3.h> // RYAN: Need this for geometry data
#include <octomap/octomap.h>
#include <octomap_ros/conversions.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <fstream>
#include <sstream>

class OctomapMapper {
public:

    OctomapMapper() : nh("~"), octree(0.1) { //0.1mm resolution
        velodyne_sub = nh.subscribe("/velodyne_points", 10, &OctomapMapper::pointCloudCallback, this); // subscribe to velodyne
        imu_sub = nh.subscribe("imu", 1000, &OctomapMapper::imuCallback, this); // RYAN: Subscribe to imu topic
        sensorOrigin = octomap::point3d(); // RYAN: Initialization of sensorOrigin
        velocity = geometry_msgs::Vector3(); // RYAN: Initialization of sensorOrigin
    }

    ~OctomapMapper() {
        saveMap("octomap.bt");
    }

    void saveMap(const std::string& filename) { // save map
        octree.writeBinary(filename);
        ROS_INFO("Saved OctoMap to %s", filename.c_str());
    }

    void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& cloud_msg) {

        // convert pointcloud2 to PCL pointcloud
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::fromROSMsg(*cloud_msg, *cloud);

        // convert PCL pointcloud to octomap pointcloud
        octomap::Pointcloud octomapCloud;
        for (auto& pt : cloud->points) {
            octomapCloud.push_back(pt.x, pt.y, pt.z);
        }

        // insert octomap pointcloud into octree
        // octomap::point3d sensorOrigin(0, 0, 0); RYAN: Moving this to be a private data member that can change over time
	    octree.insertPointCloud(octomapCloud, sensorOrigin);

        octree.updateInnerOccupancy(); // update
    }

    /*
    RYAN:
    Function callback for when the imu publishes new data.
    
    The imu msg does not have data for direct velocity, only linear acceleration.
    This linear acceleration will be added to the velocity data member.
    At the same time, the velocity will be added
    */
    void imuCallback(const sensor_msgs::Imu::ConstPtr& imu_msg) {
        octomap::point3d toAdd(velocity.x, velocity.y, velocity.z);
        sensorOrigin -= toAdd;

        velocity.x += imu_msg->linear_acceleration.x;
        velocity.y += imu_msg->linear_acceleration.y;
        velocity.z += imu_msg->linear_acceleration.z;
    }

    void spin() {
        ros::spin();
    }

private:
    ros::NodeHandle nh;
    ros::Subscriber velodyne_sub;
    ros::Subscriber imu_sub; // RYAN: subsribe to topic that vectornav publishes to
    octomap::OcTree octree;
    octomap::point3d sensorOrigin; // RYAN: Sensor origin as private data member
    geometry_msgs::Vector3 velocity; // RYAN: velocity in x, y, and z axis.
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "octomap_mapper");
    OctomapMapper mapper;
    mapper.spin();
    return 0;
}