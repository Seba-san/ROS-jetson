  #! /bin/bash
  echo "Se realiza un escaneo de todas las redes conectadas disponibles"
  echo "este seguro que se encuentra conectado a la misma red"
  red=$(ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){2}[0-9]*' | grep -v '127.0.0.1')
  red_broadcast=$red
  echo "Buscando jetson en eth0 con: sudo nmap -sP $red_broadcast.0/24" # -sP es para que solo haga ping
Nmap=$(sudo nmap -sP $red_broadcast.0/24)
Nmap_2=$(echo "$Nmap"| grep  "Nvidia" )
if [ -n "$Nmap_2" ] # las comillas en el nombre de la variable es para que la considere como una sola strings. Bash separa en dinstintos strings si hay espacios
then
  Nmap_2=$(echo "$Nmap"| grep  00:04:4B:5A:E3:65)
  if [ -n "$Nmap_2" ] # las comillas en el nombre de la variable es para que la considere como una sola strings. Bash separa en dinstintos strings si hay espacios
  then
  Mac_f1=${Nmap%00:04:4B:5A:E3:65*}
  Mac_f2=${Mac_f1##*for }
  ipjet_eth=$(echo "$Mac_f2" | grep -Eo '([0-9]*\.){3}[0-9]*')
      echo "ipjet_eth=$ipjet_eth"
        echo "Se hace un ping para guardar la entrada en tablas ARP"
      ping -c 1 "$ipjet_eth" # hago un ping para que se cargue a las tablas de arp
  fi
  Nmap_2=$(echo "$Nmap"| grep  00:04:4B:5A:E3:63)
  if [ -n "$Nmap_2" ] # las comillas en el nombre de la variable es para que la considere como una sola strings. Bash separa en dinstintos strings si hay espacios
  then
  Mac_f1=${Nmap%00:04:4B:5A:E3:63*}
  Mac_f2=${Mac_f1##*for }
  ipjet_wlan=$(echo "$Mac_f2" | grep -Eo '([0-9]*\.){3}[0-9]*')
  echo "ipjet_wlan=$ipjet_wlan"
  echo "Se hace un ping para guardar la entrada en tablas ARP"
  ping -c 1 "$ipjet_wlan"
  fi
fi
red=$(ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){2}[0-9]*' | grep -v '127.0.0.1')
red_broadcast=$red
echo "Buscando jetson en wlan0 con: sudo nmap -sP $red_broadcast.0/24" # -sP es para que solo haga ping
Nmap=$(sudo nmap -sP $red_broadcast.0/24)
Nmap_2=$(echo "$Nmap"| grep  "Nvidia" )
if [ -n "$Nmap_2" ] # las comillas en el nombre de la variable es para que la considere como una sola strings. Bash separa en dinstintos strings si hay espacios
then
  Nmap_2=$(echo "$Nmap"| grep  00:04:4B:5A:E3:65)
  if [ -n "$Nmap_2" ] # las comillas en el nombre de la variable es para que la considere como una sola strings. Bash separa en dinstintos strings si hay espacios
  then
  Mac_f1=${Nmap%00:04:4B:5A:E3:65*}
  Mac_f2=${Mac_f1##*for }
  ipjet_eth=$(echo "$Mac_f2" | grep -Eo '([0-9]*\.){3}[0-9]*')
  echo "ipjet_eth=$ipjet_eth"
    echo "Se hace un ping para guardar la entrada en tablas ARP"
    ping -c 1 "$ipjet_eth"
  fi
  Nmap_2=$(echo "$Nmap"| grep  00:04:4B:5A:E3:63)
  if [ -n "$Nmap_2" ] # las comillas en el nombre de la variable es para que la considere como una sola strings. Bash separa en dinstintos strings si hay espacios
  then
  Mac_f1=${Nmap%00:04:4B:5A:E3:63*}
  Mac_f2=${Mac_f1##*for }
  ipjet_wlan=$(echo "$Mac_f2" | grep -Eo '([0-9]*\.){3}[0-9]*')
  echo "ipjet_wlan=$ipjet_wlan"
    echo "Se hace un ping para guardar la entrada en tablas ARP"
  ping -c 1 "$ipjet_wlan"
  fi
fi


  # Abajo estan todas las explicaicones de como funciona





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
  #
  # master=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
  # if [ "$master" == "$ipjet" ]
  # then
  #   echo "No se encontro la mac 00:04:4B:5A:E3:65 por medio de nmap "
  # else
  #   echo "la ip de la jetson es $ipjet :)"
  #   echo "ssh ubuntu@$ipjet"
  #   sudo ssh ubuntu@$ipjet
  # fi
