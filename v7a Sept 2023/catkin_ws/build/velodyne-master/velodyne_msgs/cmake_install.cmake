# Install script for directory: /media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_msgs/msg" TYPE FILE FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_msgs/msg/VelodynePacket.msg"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_msgs/msg/VelodyneScan.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_msgs/cmake" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_msgs/catkin_generated/installspace/velodyne_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/include/velodyne_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/share/roseus/ros/velodyne_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/share/common-lisp/ros/velodyne_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/share/gennodejs/ros/velodyne_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/python3/dist-packages/velodyne_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/python3/dist-packages/velodyne_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_msgs/catkin_generated/installspace/velodyne_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_msgs/cmake" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_msgs/catkin_generated/installspace/velodyne_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_msgs/cmake" TYPE FILE FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_msgs/catkin_generated/installspace/velodyne_msgsConfig.cmake"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/velodyne-master/velodyne_msgs/catkin_generated/installspace/velodyne_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/velodyne_msgs" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/velodyne-master/velodyne_msgs/package.xml")
endif()

