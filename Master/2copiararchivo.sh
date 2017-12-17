#!/bin/bash

if [ ! -n "$1" ]; then
echo "debe ingresar una archivo para copiar"
exit
fi
if [ ! -n "$2" ]; then
  echo "Para evitar las siguientes preguntas ejecute"
  echo "./conexion_entorno.sh [direccion_host] [Nombre destino]"
  echo "La carpeta destino es"
  dir_jetson=$(cat $codigos/Master/direccion.txt) # Se lee la ultima direccion ingresada, para generar un cache
  echo "$dir_jetson"
  read -p "¿Desea cambiarla? [y/n] " resp
    if [ "$resp" == "y" ]; then
      echo "ingrese la nueva direccion destino"
      read dir_jetson
      echo "$dir_jetson" > direccion.txt # si se cambia la direccion, se guarda, para generar un cache
    fi
else
  dir_jetson=$1
fi
source ./conexion_entorno.sh
scp $1 nvidia@$jetson:$dir_jetson
