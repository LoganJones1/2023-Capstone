run roscore
roslaunch velodyne_pointcloud VLP16_points.launch
roslaunch realsense2_camera rs_t265.launch 
rosrun mapper mapper_node 
crtl C mapper node 
octoviz octomap.bt