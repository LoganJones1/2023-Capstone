# Install script for directory: /home/robotis/catkin_ws/src/gui_tutorials

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/robotis/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/robotis/catkin_ws/build/gui_tutorials/catkin_generated/installspace/gui_tutorials.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gui_tutorials/cmake" TYPE FILE FILES
    "/home/robotis/catkin_ws/build/gui_tutorials/catkin_generated/installspace/gui_tutorialsConfig.cmake"
    "/home/robotis/catkin_ws/build/gui_tutorials/catkin_generated/installspace/gui_tutorialsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gui_tutorials" TYPE FILE FILES "/home/robotis/catkin_ws/src/gui_tutorials/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gui_tutorials" TYPE DIRECTORY FILES
    "/home/robotis/catkin_ws/src/gui_tutorials/config"
    "/home/robotis/catkin_ws/src/gui_tutorials/launch"
    "/home/robotis/catkin_ws/src/gui_tutorials/maps"
    "/home/robotis/catkin_ws/src/gui_tutorials/meshes"
    "/home/robotis/catkin_ws/src/gui_tutorials/models"
    "/home/robotis/catkin_ws/src/gui_tutorials/params"
    "/home/robotis/catkin_ws/src/gui_tutorials/rviz"
    "/home/robotis/catkin_ws/src/gui_tutorials/src"
    "/home/robotis/catkin_ws/src/gui_tutorials/urdf"
    "/home/robotis/catkin_ws/src/gui_tutorials/worlds"
    )
endif()

