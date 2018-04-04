#!/bin/bash
# info sacada de: https://unix.stackexchange.com/questions/72125/correct-way-to-mount-a-hard-drive
# Con sudo fdisk -l se fija las tablas de particion: fdisk - manipulate disk partition table
# con -l lista todas las DISPONIBLES, es decir, las que estan montadas y las que no.
sudo fdisk -l | grep 465.8 GiB # Suponiendo que el disco tiene una capacidad de "465.8 GiB". Para este ejemplo uso el "discoaye"

sudo fdisk -l | grep 698,7 | grep -Eo /dev/*


# Procedimiento para montar el disco
# si no esta creada la carpeta, crearla
sudo mkdir /media/nvidia/DiscoHDD
# por medio de sudo fdisk -l, buscar el disco (lo reconoces por la capacidad). Y luego seleccionar la particion de ese disco. Por lo general es "sda2" (la que tiene mayor capacidad)
sudo mount -t ntfs /dev/sda2 /media/nvidia/DiscoHDD
# Crear un link simbolico
ln -s /media/nvidia/DiscoHDD/discoaye ~/discoaye # Para crear el link simbolico

# Actualizar un link simbolico.
ln -sf /media/nvidia/DiscoHDD/discoaye ~/discoaye # Para actualizar el link simbolico. 

#Para desmontar poner umount /media/nvidia/DiscoHDD

################### Otra forma es poner
lsblk









