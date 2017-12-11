#!/bin/bash


source ./conexion.sh
cd ~
source /opt/ros/kinetic/setup.sh
echo "Se asume que el workspace esta en ~/catkin_ws"
cd ~/catkin_ws
source devel/setup.bash
echo $ROS_PACKAGE_PATH
export ROS_MASTER_URI=http://$master:11311
export ROS_IP=$jetson
