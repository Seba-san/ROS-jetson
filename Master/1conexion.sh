#!/bin/bash


source ./conexion_entorno.sh
if  [ -n "$ipjet_eth" ]
    then
      ssh nvidia@$ipjet_eth
      exit
    fi

if  [ -n "$ipjet_wlan" ]
    then
      ssh nvidia@$ipjet_wlan
      exit
    fi


 
#borro todos las variables que no se usan

# Cuando se encuentra con nmap, hay que cargar la ip en las tablas de arp, asi es mas facil de enocntrar luego.
