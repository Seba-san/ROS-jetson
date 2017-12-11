#!/bin/bash
# lee las ip configuradas
echo "Asume que el master es desde donde se hizo la conexion ssh"
jetson_eth=$(ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
jetson_wlan=$(ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
#busca en los registros la ultima IP conectada
master=$(sudo cat /var/log/auth* | grep Accepted | awk 'NR==1 {print $11  }') # busca el registro de conexiones y se queda con la ultima

echo "master $master"
echo "jetson_eth $jetson_eth"
echo "jetson_wlan $jetson_wlan"
