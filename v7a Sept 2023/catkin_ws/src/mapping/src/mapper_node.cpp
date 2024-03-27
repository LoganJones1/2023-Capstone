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
        sensorOrigin = octomap::point3d();
        velocity = geometry_msgs::Vector3();
        orientation = octomath::Vector3();
        frameOrigin = octomath::Pose6D();
        gravity_dir = octomath::Vector3();
        first_imu_call = true;
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
    The imu callback is set to be called 200 times per second (which is the fps of the gyro sensor)
    */

    void imuCallback(const sensor_msgs::Imu::ConstPtr &imu_msg)
    {
        // Getting initial gravity direction
        if (first_imu_call)
        {
            first_imu_call = false;
            gravity_dir = octomath::Vector3(imu_msg->linear_acceleration.x, imu_msg->linear_acceleration.y, imu_msg->linear_acceleration.z);
            gravity_dir.normalize();
        }

        // Linear acceleration
        octomap::point3d toAdd(velocity.x / 200, velocity.y / 200, velocity.z / 200);
        sensorOrigin -= toAdd;
        double linearAccelerationTolerance = 0.05;
        if (toAdd.x() > linearAccelerationTolerance || toAdd.x() < -linearAccelerationTolerance) {
            //ROS_INFO("\nADDING X FOR LA");
            velocity.x += (imu_msg->linear_acceleration.x - gravity_dir.x() * 9.81) / 200;
        }
        if (toAdd.z() > linearAccelerationTolerance || toAdd.z() < -linearAccelerationTolerance) {
            //ROS_INFO("\nADDING Y FOR LA");
            velocity.y += (imu_msg->linear_acceleration.z - gravity_dir.z() * 9.81) / 200;
        }
        if (toAdd.y() > linearAccelerationTolerance || toAdd.y() < -linearAccelerationTolerance) {
            //ROS_INFO("\nADDING Z FOR LA");
            velocity.z += (imu_msg->linear_acceleration.y - gravity_dir.y() * 9.81) / 200;
        }
        /*
        ROS_INFO("\nLinear Accelereation: (%f, %f, %f)\ngravity: (%f, %f, %f)\nvelocity:(%f, %f, %f)",
            toAdd.x(), toAdd.z(), toAdd.y(),
            gravity_dir.x(), gravity_dir.z(), gravity_dir.y(),
            velocity.x, velocity.y, velocity.z);
        */

        // Orientation and tracking gravity
        octomath::Vector3 angularVelocity(imu_msg->angular_velocity.x / 200, imu_msg->angular_velocity.z / 200, imu_msg->angular_velocity.y / 200);
        //ROS_INFO("\nAngular Velocity: (%f, %f, %f)", angularVelocity.x(), angularVelocity.y(), angularVelocity.z());
        octomath::Vector3 rotation(0, 0, 0);
        bool significantChange = false;
        double angularVelocityTolerance = 0.0004;
        if (angularVelocity.x() > angularVelocityTolerance || angularVelocity.x() < -angularVelocityTolerance) {
            //ROS_INFO("\nADDING X FOR AV");
            orientation.x() += angularVelocity.x();
            rotation.x() = angularVelocity.x();
            significantChange = true;
        }
        if (angularVelocity.y() > angularVelocityTolerance || angularVelocity.y() < -angularVelocityTolerance) {
            //ROS_INFO("\nADDING Y FOR AV");
            orientation.y() += angularVelocity.y();
            rotation.y() = angularVelocity.y();
            significantChange = true;
        }
        if (angularVelocity.z() > angularVelocityTolerance || angularVelocity.z() < -angularVelocityTolerance) {
            //ROS_INFO("\nADDING Z FOR AV");
            orientation.z() += angularVelocity.z();
            rotation.z() = angularVelocity.z();
            significantChange = true;
        }
        //ROS_INFO("Orientation: (%f, %f, %f)",
            //orientation.x(), orientation.y(), orientation.z());

        if (significantChange) {
            octomath::Quaternion reversedOrientation(orientation * -1);
            frameOrigin = octomath::Pose6D(sensorOrigin, reversedOrientation);

            gravity_dir.rotate_IP(angularVelocity.x(), angularVelocity.y(), angularVelocity.z());
        }
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
    octomath::Vector3 orientation; // Euler angles of orientation (in radians)
    octomath::Pose6D frameOrigin; // To be passed into octomap

    // Tracking gravity
    octomath::Vector3 gravity_dir;
    bool first_imu_call;    // This is a flag meant to keep track of the first imu call-back.
                            // The purpose of this is to get the initial direction of gravity, based on the linear acceleration of the imu
};

int main(int argc, char **argv)

{
    ros::init(argc, argv, "octomap_mapper");
    OctomapMapper mapper;
    mapper.spin();
    return 0;
}
