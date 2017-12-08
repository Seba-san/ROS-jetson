#!/bin/bash
master=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

echo "Buscando en tablas de arp 00:04:4B:5A:E3:65"
ipjet=$(arp -n | grep -i 00:04:4B:5A:E3:65)
ipjet_2=${ipjet%%ether*}
ipjet_2=${ipjet_2:0:12}
  if [ "$master" == "$ipjet_2" ]
  then
    echo -e  "\e[0;31mNo se encontro la mac 00:04:4B:5A:E3:65 por medio de tabla arp \e[0m"
  else
    jetson=$ipjet_2
    echo -e "\e[0;32mla ip de la jetson es $jetson :) \e[0m"
    echo "se obtuvo por medio de tablas arp"
  fi


  echo "Buscando jetson con: sudo nmap -sP 192.168.6.0/24" # -sP es para que solo haga ping
  Nmap=$(sudo nmap -sP 192.168.6.0/24)
  #echo "$direccion2" | grep -i '00:04:4B:5A:E3:63'
  #echo "$direccion2"
  echo "Se hace la busqueda suponiendo que la MAC es: 00:04:4B:5A:E3:65"
  Mac_f1=${Nmap%00:04:4B:5A:E3:65*} # borra todo desde que encuentra la mac
  #Mac_f1=${Nmap%00:04:4B:5A:E3:63*}
  #if $direccion1==$direccion2 then echo "no se encuentra la jetson"
  #echo "$direccion1"
  Mac_f2=${Mac_f1##*for } # borra de atras para adelante desde que encuentra la palabra "for "
  #echo "poner echo $ Mac_f2 para saber si se encontro realmente la mac buscada "
  #echo "$direccion0"
  ipjet=${Mac_f2:0:12}
  if [ "$master" == "$ipjet" ]
  then
    echo -e  "\e[0;31mNo se encontro la mac 00:04:4B:5A:E3:65 por medio de nmap \e[0m"

  else
    jetson_nmap=$ipjet
    echo -e "\e[0;32mla ip de la jetson es $jetson_nmap :) \e[0m"
    echo "se obtuvo por medio de nmap"
    #agrego la ip a los host acutales
  fi

#borro todos las variables que no se usan
unset Nmap
unset Mac_f1
unset Mac_f2
unset ipjet
unset ipjet_2
echo -e "\e[0;34mmaster $master \e[0m "
# Cuando se encuentra con nmap, hay que cargar la ip en las tablas de arp, asi es mas facil de enocntrar luego.
