# Install script for directory: /media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_sdk_examples/msg" TYPE FILE FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/msg/SetPosition.msg"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/msg/SyncSetPosition.msg"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/msg/BulkSetItem.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_sdk_examples/srv" TYPE FILE FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/srv/GetPosition.srv"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/srv/SyncGetPosition.srv"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/srv/BulkGetItem.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_sdk_examples/cmake" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/catkin_generated/installspace/dynamixel_sdk_examples-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/include/dynamixel_sdk_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/share/roseus/ros/dynamixel_sdk_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/share/common-lisp/ros/dynamixel_sdk_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/share/gennodejs/ros/dynamixel_sdk_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/python3/dist-packages/dynamixel_sdk_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/python3/dist-packages/dynamixel_sdk_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/catkin_generated/installspace/dynamixel_sdk_examples.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_sdk_examples/cmake" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/catkin_generated/installspace/dynamixel_sdk_examples-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_sdk_examples/cmake" TYPE FILE FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/catkin_generated/installspace/dynamixel_sdk_examplesConfig.cmake"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/catkin_generated/installspace/dynamixel_sdk_examplesConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dynamixel_sdk_examples" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk_examples/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/read_write_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/read_write_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/read_write_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples" TYPE EXECUTABLE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/dynamixel_sdk_examples/read_write_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/read_write_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/read_write_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/read_write_node"
         OLD_RPATH "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/read_write_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/sync_read_write_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/sync_read_write_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/sync_read_write_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples" TYPE EXECUTABLE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/dynamixel_sdk_examples/sync_read_write_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/sync_read_write_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/sync_read_write_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/sync_read_write_node"
         OLD_RPATH "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/sync_read_write_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/bulk_read_write_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/bulk_read_write_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/bulk_read_write_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples" TYPE EXECUTABLE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/dynamixel_sdk_examples/bulk_read_write_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/bulk_read_write_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/bulk_read_write_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/bulk_read_write_node"
         OLD_RPATH "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/bulk_read_write_node")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/indirect_address_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/indirect_address_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/indirect_address_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples" TYPE EXECUTABLE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib/dynamixel_sdk_examples/indirect_address_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/indirect_address_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/indirect_address_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/indirect_address_node"
         OLD_RPATH "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/devel/lib:/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/dynamixel_sdk_examples/indirect_address_node")
    endif()
  endif()
endif()

