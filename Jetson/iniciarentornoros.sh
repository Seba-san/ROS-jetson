#!/bin/bash


source conexion.sh
cd ~
source /opt/ros/kinetic/setup.sh
cd ~/catkin_ws
source devel/setup.bash
echo $ROS_PACKAGE_PATH
export ROS_MASTER_URI=http://$master:11311 
export ROS_IP=$jetson

