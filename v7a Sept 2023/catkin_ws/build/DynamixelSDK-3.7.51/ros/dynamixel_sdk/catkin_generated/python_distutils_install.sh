#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/install/lib/python3/dist-packages:/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build" \
    "/usr/bin/python3" \
    "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/src/DynamixelSDK-3.7.51/ros/dynamixel_sdk/setup.py" \
     \
    build --build-base "/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/build/DynamixelSDK-3.7.51/ros/dynamixel_sdk" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/install" --install-scripts="/media/sf_Git_Repo/2023-Capstone/v7a Sept 2023/catkin_ws/install/bin"
