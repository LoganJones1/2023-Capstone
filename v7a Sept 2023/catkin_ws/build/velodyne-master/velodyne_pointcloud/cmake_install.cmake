# Install script for directory: /media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_pointcloud

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/velodyne_pointcloud" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/include/velodyne_pointcloud/TransformNodeConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/velodyne_pointcloud" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/python3/dist-packages/velodyne_pointcloud/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/python3/dist-packages/velodyne_pointcloud/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/velodyne_pointcloud" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/python3/dist-packages/velodyne_pointcloud/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_pointcloud/catkin_generated/installspace/velodyne_pointcloud.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_pointcloud/cmake" TYPE FILE FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_pointcloud/catkin_generated/installspace/velodyne_pointcloudConfig.cmake"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_pointcloud/catkin_generated/installspace/velodyne_pointcloudConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_pointcloud" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_pointcloud/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/velodyne_pointcloud" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_pointcloud/include/velodyne_pointcloud/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_pointcloud" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_pointcloud/nodelets.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_pointcloud/launch" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_pointcloud/launch/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_pointcloud/params" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_pointcloud/params/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/velodyne_pointcloud" TYPE PROGRAM FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_pointcloud/scripts/gen_calibration.py")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_pointcloud/src/lib/cmake_install.cmake")
  include("/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_pointcloud/src/conversions/cmake_install.cmake")
  include("/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_pointcloud/tests/cmake_install.cmake")

endif()

