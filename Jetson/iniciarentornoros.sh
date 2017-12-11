#!/bin/bash


source ./conexion.sh
cd ~
source /opt/ros/kinetic/setup.sh
echo "Se asume que el workspace esta en ~/catkin_ws"
# NO ESTA DECLARADO ROS_WORKSPACE :(
cd ~/catkin_ws
source devel/setup.bash
echo $ROS_PACKAGE_PATH
export ROS_MASTER_URI=http://$master:11311
echo "ejecute el siguiente comando:"
echo -e "export ROS_IP=\e[1;32m\$jetson_xxx \e[0m"
echo -e "poniendo \e[1;31m\$jetson_eth \e[0m si se conecta via eth o \e[1;31m\$jetson_wlan \e[0m por wlan0  "
