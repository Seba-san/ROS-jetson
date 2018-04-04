#!/bin/bash

if [ ! -n "$1" ]; then
echo "debe ingresar una direccion para copiar"
exit
fi
if [ ! -n "$2" ]; then
  echo "Para evitar las siguientes preguntas ejecute"
  echo "./copiar_jetson_vaio.sh [Nombre destino] [direccion_host]"
  echo "La carpeta origen es"
  dir_jetson=$(cat ./direccion.txt) # Se lee la ultima direccion ingresada, para generar un cache
  echo "$dir_jetson"
  read -p "¿Desea cambiarla? [y/n] " resp
    if [ "$resp" == "y" ]; then
      echo "ingrese la nueva direccion origen"
      read dir_jetson
      echo "$dir_jetson" > direccion.txt # si se cambia la direccion, se guarda, para generar un cache
    fi
else
  dir_jetson=$2
fi
source $codigos/Master/conexion_entorno.sh
scp -r nvidia@$jetson:$dir_jetson $1
