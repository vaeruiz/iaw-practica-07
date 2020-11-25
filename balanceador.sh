#!/bin/bash

# VARIABLES
IP_PRIVADA_FRONTAL1=172.31.88.245
IP_PRIVADA_FRONTAL2=172.31.90.53

# Activar depuración
set -x

# Actualizar repositorios.
apt update 

# Instalar nginx.
apt install nginx -y

# Copiar el archivo de configuración y cambiar los valores.
cp default /etc/nginx/sites-available/
sed -i "s/ip_privada_frontal1/$IP_PRIVADA_FRONTAL1/" /etc/nginx/sites-available/default
sed -i "s/ip_privada_frontal2/$IP_PRIVADA_FRONTAL2/" /etc/nginx/sites-available/default

# Reiniciar nginx.
systemctl restart nginx