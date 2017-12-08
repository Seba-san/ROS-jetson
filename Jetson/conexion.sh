#!/bin/bash
#master=192.168.211.2
jetson=$(ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

master1=$(netstat -tnpa | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v 0.0.0.0 |grep -v 127.0.0.1 |grep -v 127.0.1.1 |grep -v $jetson
)
master=${master1:0:12}  

echo "master $master"
echo "jetson $jetson"
