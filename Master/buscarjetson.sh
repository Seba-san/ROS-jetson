#! /bin/bash
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

master=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
if [ "$master" == "$ipjet" ]
then
  echo "No se encontro la mac 00:04:4B:5A:E3:65 por medio de nmap "
else
  echo "la ip de la jetson es $ipjet :)"
  echo "ssh ubuntu@$ipjet"
  sudo ssh ubuntu@$ipjet
fi
