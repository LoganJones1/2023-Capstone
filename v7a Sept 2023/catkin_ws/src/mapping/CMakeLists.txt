cmake_minimum_required(VERSION 3.0.2)
project(mapping)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  octomap_msgs
  octomap_ros
  roscpp
  std_msgs
  sensor_msgs
  nav_msgs
  visualization_msgs  # Add this if you're using visualization_msgs for RViz
)

## Declare a catkin package
catkin_package(
  CATKIN_DEPENDS octomap_msgs octomap_ros roscpp std_msgs sensor_msgs nav_msgs visualization_msgs
)

## Specify additional locations of header files
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Declare a C++ executable for each of your cpp files
add_executable(octomap_processing_node src/octomap_processing.cpp)
add_executable(ros_communication_node src/ros_communication.cpp)
add_executable(map_visualization_node src/map_visualization.cpp)

## Add cmake target dependencies of the executable
add_dependencies(octomap_processing_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(ros_communication_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(map_visualization_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
target_link_libraries(octomap_processing_node ${catkin_LIBRARIES})
target_link_libraries(ros_communication_node ${catkin_LIBRARIES})
target_link_libraries(map_visualization_node ${catkin_LIBRARIES})
