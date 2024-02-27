execute_process(COMMAND "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
