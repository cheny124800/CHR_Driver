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
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/dji/DJI_Onboard_Sdk/src/Onboard-SDK-ROS/dji_sdk"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/dji/DJI_Onboard_Sdk/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/dji/DJI_Onboard_Sdk/install/lib/python2.7/dist-packages:/home/dji/DJI_Onboard_Sdk/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/dji/DJI_Onboard_Sdk/build" \
    "/usr/bin/python" \
    "/home/dji/DJI_Onboard_Sdk/src/Onboard-SDK-ROS/dji_sdk/setup.py" \
    build --build-base "/home/dji/DJI_Onboard_Sdk/build/Onboard-SDK-ROS/dji_sdk" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/dji/DJI_Onboard_Sdk/install" --install-scripts="/home/dji/DJI_Onboard_Sdk/install/bin"
