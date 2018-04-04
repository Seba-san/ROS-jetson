#!/bin/bash
# Busco los nombres de las interfaces
#interfaces=$(ls /sys/class/net/)
#echo "Se conectraron las siguientes interfaces"
#echo $interfaces
ethernet=$(ls /sys/class/net/ | grep e )
wireles=$(ls /sys/class/net/ | grep w )

