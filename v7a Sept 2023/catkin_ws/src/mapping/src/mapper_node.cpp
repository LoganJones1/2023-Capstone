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
#include <octomap_msgs/Octomap.h>
#include <octomap_msgs/conversions.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <fstream>
#include <sstream>

class OctomapMapper
{
public:
    OctomapMapper() : nh("~"), octree(0.01), octomap_pub(nh.advertise<octomap_msgs::Octomap>("octomap", 1, true))
    { // 0.1 resolution, publishing to a topic that rviz can subscribe to.
        velodyne_sub = nh.subscribe("/velodyne_points", 10, &OctomapMapper::pointCloudCallback, this); // subscribe to velodyne
        imu_sub = nh.subscribe("/camera/imu", 200, &OctomapMapper::imuCallback, this); // subscribe to imu topic
        sensorOrigin = octomap::point3d();
        velocity = geometry_msgs::Vector3();
        orientation_q = octomath::Vector3();
        frameOrigin = octomath::Pose6D();
        gravity_dir = octomath::Vector3();
        first_imu_call = true;
    }

    ~OctomapMapper()
    {
        saveMap("myMap.bt");
    }

    void publishOctomap()
    {
        octomap_msgs::Octomap msg;
        msg.header.frame_id = "velodyne";  // or whatever your fixed frame is
        msg.header.stamp = ros::Time::now();
        octomap_msgs::binaryMapToMsg(octree, msg);
        octomap_pub.publish(msg);
    }

    void saveMap(const std::string &filename)
    { // save map
        octree.writeBinary(filename);
        ROS_INFO("Saved OctoMap to %s", filename.c_str());
    }
    void imuCallback(const sensor_msgs::Imu::ConstPtr& imu_msg) {
    // Convert ROS quaternion to octomap quaternion
    octomath::Quaternion orientation_q(imu_msg -> orientation.w, imu_msg -> orientation.x, imu_msg -> orientation.y, imu_msg -> orientation.z);

    // on the first IMU call, set initial orientation and initial gravity direction
    if (first_imu_call) {
        first_imu_call = false;
        gravity_dir = octomath::Vector3(imu_msg->linear_acceleration.x, imu_msg->linear_acceleration.y, imu_msg->linear_acceleration.z);
        gravity_dir = orientation_q.rotate(gravity_dir); // rotate gravity direction into the sensor frame
        gravity_dir.normalize();
    }

    // Rotate linear acceleration from sensor frame to world frame
    octomath::Vector3 linear_acceleration(imu_msg->linear_acceleration.x, imu_msg->linear_acceleration.y, imu_msg->linear_acceleration.z);
    linear_acceleration = orientation_q.rotate(linear_acceleration) - gravity_dir * 9.8; // subtract gravity vector

    // update velocity (considering the callback frequency for integration time step)
    double dt = 1.0 / 200.0; // Assuming imuCallback is called at 200 Hz
    velocity.x += linear_acceleration.x() * dt;
    velocity.y += linear_acceleration.y() * dt;
    velocity.z += linear_acceleration.z() * dt;

    // sensorOrigin is updated based on new velocity
    sensorOrigin.x() += velocity.x * dt;
    sensorOrigin.y() += velocity.y * dt;
    sensorOrigin.z() += velocity.z * dt;

    // orientation is updated based on angular velocity
    // Assuming small angles, we approximate rotation vector = angular velocity * dt
    octomath::Vector3 angular_velocity(imu_msg->angular_velocity.x, imu_msg->angular_velocity.y, imu_msg->angular_velocity.z);
    
     double angle = angular_velocity.norm() * dt; // Angular velocity magnitude * dt = rotation angle
    octomath::Vector3 axis = angular_velocity.normalized(); // mormalized angular velocity vector as rotation axis

    // conversion from axis-angle to quaternion
    octomath::Quaternion delta_orientation(cos(angle / 2),
                                            axis.x() * sin(angle / 2),
                                            axis.y() * sin(angle / 2),
                                            axis.z() * sin(angle / 2));
    
    orientation_q = orientation_q * delta_orientation;
    orientation_q.normalize();

    // update frame origin with new orientation & position
    frameOrigin = octomath::Pose6D(sensorOrigin, orientation_q);

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

        octomap::point3d sensorPos = sensorOrigin;
        octree.insertPointCloud(octomapCloud, sensorPos, frameOrigin, true);

        // insert octomap pointcloud into octree
        octree.insertPointCloud(octomapCloud, sensorOrigin, frameOrigin);
        octree.updateInnerOccupancy(); // update
    }


    void spin()
    {
        ros::spin();
    }

private:
    ros::NodeHandle nh;
    ros::Subscriber velodyne_sub;
    ros::Subscriber imu_sub; // subsribe to topic that camera imu publishes to
    ros::Publisher octomap_pub;
    octomap::OcTree octree;

    // For linear acceleration of IMU
    octomap::point3d sensorOrigin; // Sensor origin as private data member
    geometry_msgs::Vector3 velocity; // velocity in x, y, and z axis.

    // For orientation
    octomath::Quaternion orientation_q; // Euler angles of orientation (in radians)
    octomath::Pose6D frameOrigin; // To be passed into octomap

    // Tracking gravity
    octomath::Vector3 gravity_dir;
    bool first_pcl_call;
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
