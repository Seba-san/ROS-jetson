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

# Compresion

# tar -czvf empaquetado.tar.gz /carpeta/a/empaquetar/
# Descomprimir
#tar -xzvf archivo.tar.gz

# Copiar por netcat; Para que funcione hay que activar el puerto en el firewall o desactivar el fierewall "ufw": sudo ufw disable  

# en destino poner: nc -l -v 15324

# nc -l -v -q0  15324 > prueba1.tar.gz

# nc -v -q0 10.0.0.11 15324 < estereo.tar.gz
