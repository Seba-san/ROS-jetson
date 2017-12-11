#! /bin/bash

source "$codigos"/Master/conexion.sh
#Me paro en el home
cd ~
#cada vez que se inicia una nueva shell hay que poner:
source /opt/ros/kinetic/setup.bash
#Ir al directorio del workspace:
cd ./Dropbox/Facultad/CIN/Proyectos/ROS/catkin_ws
#agregar las variables al bash:
source devel/setup.bash
#Se testea si se agregaron bien las variables de entorno
echo 'Probando variable de entorno ROS_PACKAGE_PATH'
echo $ROS_PACKAGE_PATH
echo 'Si lo anterior funciono como se esperaba escriba: '
echo 'echo $ROS_PACKAGE_PATH'
echo 'en la consola, deveria aparecer lo mismo Si no aparece lo mismo ejecute: '
echo 'source iniciarentornoros.sh'
# el comando source sirve para que los comantos ateriores se ejecuten sobre la consola y no en una
# consola a parte y que las variables no se guarden

export ROS_MASTER_URI=http://$master:11311
export ROS_IP=$master
