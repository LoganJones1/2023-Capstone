#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/Imu.h> // Vectornav packages automatically convert sensor data to this Imu message format
#include <geometry_msgs/Vector3.h> // For velocity
#include <geometry_msgs/Quaternion.h> // For angle
#include <octomap/octomap.h>
#include <octomap/math/Quaternion.h>
#include <octomap/math/Pose6D.h>
#include <octomap/math/Vector3.h>
#include <octomap_ros/conversions.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <fstream>
#include <sstream>

class OctomapMapper
{

public:
    OctomapMapper() : nh("~"), octree(0.1)
    { // 0.1mm resolution
        velodyne_sub = nh.subscribe("/velodyne_points", 10, &OctomapMapper::pointCloudCallback, this); // subscribe to velodyne
        imu_sub = nh.subscribe("/camera/imu", 1000, &OctomapMapper::imuCallback, this); // Subscribe to imu topic
        sensorOrigin = octomap::point3d(); // Initialization of sensorOrigin
        velocity = geometry_msgs::Vector3(); // Initialization of velocity
        frameOrigin = octomath::Pose6D();    // Initialization of frameOrigin
    }

    ~OctomapMapper()
    {
        saveMap("octomap.bt");
    }

    void saveMap(const std::string &filename)
    { // save map
        octree.writeBinary(filename);
        ROS_INFO("Saved OctoMap to %s", filename.c_str());
    }

    void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr &cloud_msg)
    {
        // convert pointcloud2 to PCL pointcloud
        pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
        pcl::fromROSMsg(*cloud_msg, *cloud);

        // convert PCL pointcloud to octomap pointcloud
        octomap::Pointcloud octomapCloud;
        for (auto &pt : cloud->points)
        {
            octomapCloud.push_back(pt.x, pt.y, pt.z);
        }

        // insert octomap pointcloud into octree

        octree.insertPointCloud(octomapCloud, sensorOrigin, frameOrigin);
        octree.updateInnerOccupancy(); // update
    }

    /*
    RYAN:
    Function callback for when the imu publishes new data.

    The imu msg does not have data for direct velocity, only linear acceleration.
    This linear acceleration will be added to the velocity data member.
    At the same time, the velocity will be added.
    The imu callback is called 200 times per second (which is the fps of the camera's gyroscope)
    */

    void imuCallback(const sensor_msgs::Imu::ConstPtr &imu_msg)
    {

        // Linear acceleration
        octomap::point3d toAdd(velocity.x / 200, velocity.y / 200, velocity.z / 200);
        sensorOrigin -= toAdd;
        velocity.x += imu_msg->linear_acceleration.x / 200;
        velocity.y += imu_msg->linear_acceleration.y / 200;
        velocity.z += imu_msg->linear_acceleration.z / 200;

        // Orientation
        octomath::Quaternion imuOrientation(imu_msg->orientation.w, imu_msg->orientation.x, imu_msg->orientation.y, imu_msg->orientation.z);
        octomath::Vector3 eulerOrientation = imuOrientation.toEuler();
        eulerOrientation *= -1;
        octomath::Quaternion reversedOrientation(eulerOrientation);
        frameOrigin = octomath::Pose6D(sensorOrigin, reversedOrientation);
    }

    void spin()
    {

        ros::spin();
    }

private:
    ros::NodeHandle nh;
    ros::Subscriber velodyne_sub;
    ros::Subscriber imu_sub; // subsribe to topic that camera imu publishes to
    octomap::OcTree octree;

    // For linear acceleration of IMU
    octomap::point3d sensorOrigin; // Sensor origin as private data member
    geometry_msgs::Vector3 velocity; // velocity in x, y, and z axis.

    // For orientation
    octomath::Pose6D frameOrigin;
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "octomap_mapper");
    OctomapMapper mapper;
    mapper.spin();
    return 0;
}