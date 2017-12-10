#!/bin/bash
master_eth=$(ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
master_wlan=$(ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

ipjet_wlan=$(arp -n | grep -i 00:04:4B:5A:E3:63 | grep -Eo '([0-9]*\.){3}[0-9]*' )
ipjet_eth=$(arp -n | grep -i 00:04:4B:5A:E3:65 | grep -Eo '([0-9]*\.){3}[0-9]*' )
  if  [ -n "$ipjet_eth" ]
  then
    jetson_eth=$ipjet_eth
      echo -e "\e[0;32mla ip de la jetson via ethernet es $jetson_eth :) \e[0m"
      echo "se obtuvo por medio de tablas arp"
  fi
  if  [ -n "$ipjet_wlan" ]
  then
    jetson_wlan=$ipjet_wlan
    echo -e "\e[0;32mla ip de la jetson via wifi es $jetson_wlan :) \e[0m"
    echo "se obtuvo por medio de tablas arp"
  fi

  if  [ ! -n "$ipjet_wlan" ]
    then
  echo -e  "\e[0;31mNo se encontro la mac 00:04:4B:5A:E3:65 /3 por medio de tabla arp \e[0m"
    ./buscarjetson.sh # se busca la jetson por todas las interfaces. Si lo encuentra, se carga en tablas arp
    ipjet_wlan=$(arp -n | grep -i 00:04:4B:5A:E3:63 | grep -Eo '([0-9]*\.){3}[0-9]*' )
    ipjet_eth=$(arp -n | grep -i 00:04:4B:5A:E3:65 | grep -Eo '([0-9]*\.){3}[0-9]*' )
    if  [ -n "$ipjet_eth" ]
    then
      jetson_eth=$ipjet_eth
        echo -e "\e[0;32mla ip de la jetson via ethernet es $jetson_eth :) \e[0m"
        echo "se obtuvo por medio de tablas arp"
    fi
    if  [ -n "$ipjet_wlan" ]
    then
      jetson_wlan=$ipjet_wlan
      echo -e "\e[0;32mla ip de la jetson via wifi es $jetson_wlan :) \e[0m"
      echo "se obtuvo por medio de tablas arp"
    fi
fi
if [ ! -n "$ipjet_wlan" ] && [ ! -n "$ipjet_eth" ];
then
  echo -e  "\e[0;31mNo se encontro una mac asociada con NVidia en todas las interfaces \e[0m"
fi
unset Nmap
unset Mac_f1
unset Mac_f2
unset ipjet
unset ipjet_2
echo -e "\e[0;34mmaster ethernet $master_eth \e[0m "
echo -e "\e[0;34mmaster wifi $master_wlan \e[0m "
if  [ -n "$ipjet_eth" ]
    then
      ssh nvidia@$ipjet_eth
    fi

if  [ -n "$ipjet_wlan" ]
    then
      ssh nvidia@$ipjet_wlan
    fi


  # echo "Buscando jetson con: sudo nmap -sP 192.168.6.0/24" # -sP es para que solo haga ping
  # Nmap=$(sudo nmap -sP 192.168.6.0/24)
  # #echo "$direccion2" | grep -i '00:04:4B:5A:E3:63'
  # #echo "$direccion2"
  # echo "Se hace la busqueda suponiendo que la MAC es: 00:04:4B:5A:E3:65"
  # Mac_f1=${Nmap%00:04:4B:5A:E3:65*} # borra todo desde que encuentra la mac
  # #Mac_f1=${Nmap%00:04:4B:5A:E3:63*}
  # #if $direccion1==$direccion2 then echo "no se encuentra la jetson"
  # #echo "$direccion1"
  # Mac_f2=${Mac_f1##*for } # borra de atras para adelante desde que encuentra la palabra "for "
  # #echo "poner echo $ Mac_f2 para saber si se encontro realmente la mac buscada "
  # #echo "$direccion0"
  # ipjet=${Mac_f2:0:12}
  # if [ "$master" == "$ipjet" ]
  # then
  #   echo -e  "\e[0;31mNo se encontro la mac 00:04:4B:5A:E3:65 por medio de nmap \e[0m"
  #
  # else
  #   jetson_nmap=$ipjet
  #   echo -e "\e[0;32mla ip de la jetson es $jetson_nmap :) \e[0m"
  #   echo "se obtuvo por medio de nmap"
  #   #agrego la ip a los host acutales
  # fi

#borro todos las variables que no se usan

# Cuando se encuentra con nmap, hay que cargar la ip en las tablas de arp, asi es mas facil de enocntrar luego.
