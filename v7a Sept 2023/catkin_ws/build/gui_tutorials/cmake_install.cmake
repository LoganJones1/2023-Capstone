# Install script for directory: /media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/gui_tutorials/catkin_generated/installspace/gui_tutorials.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gui_tutorials/cmake" TYPE FILE FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/gui_tutorials/catkin_generated/installspace/gui_tutorialsConfig.cmake"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/gui_tutorials/catkin_generated/installspace/gui_tutorialsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gui_tutorials" TYPE FILE FILES "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gui_tutorials" TYPE DIRECTORY FILES
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/config"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/launch"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/maps"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/meshes"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/models"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/params"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/rviz"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/src"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/urdf"
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/gui_tutorials/worlds"
    )
endif()

