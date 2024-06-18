#!/bin/bash

# POST INSTALL
echo "Instalando las herramientas para tu Termux"
echo ""
echo "By R3DGHOST - GHOSTRYZECOMPANY"
sleep 3
clear

# Actualización de paquetes e instalación de herramientas necesarias
pkg update && pkg install -y git 
pkg install -y python
pkg install -y nmap
pkg install -y tur-repo
pkg install -y cloudflared
pkg install -y slowhttptest
pkg install -y whois
pkg install -y host
pkg install -y python3
pkg install -y python2
pip install maigret

# Creación del directorio de herramientas y clonación de repositorios
git clone --depth=1 https://github.com/htr-tech/zphisher.git
git clone https://github.com/R3D-GHOST/Scan-Nmap.git
git clone https://github.com/jaykali/maskphish.git
git clone https://github.com/abhinavkavuri/PhoneInfoga

# Configuración de PhoneInfoga
cd PhoneInfoga
mv config.example.py config.py
python3 -m pip install -r requirements.txt
chmod +x *

cd ../

cd

echo "bash termuxpack/menu.sh" > start.sh

chmod +x start.sh

echo "Se esta ejecutando recuerda ejecutar ./start.sh cada vez que inicies una nueva sesion en termux"
sleep 4
./start.sh
