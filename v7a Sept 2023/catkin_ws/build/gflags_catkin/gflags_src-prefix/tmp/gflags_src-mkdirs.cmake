# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/src/gflags_src"
  "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/src/gflags_src-build"
  "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix"
  "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/tmp"
  "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/src/gflags_src-stamp"
  "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/src"
  "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/src/gflags_src-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/src/gflags_src-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/robotis/catkin_ws/build/gflags_catkin/gflags_src-prefix/src/gflags_src-stamp${cfgdir}") # cfgdir has leading slash
endif()
