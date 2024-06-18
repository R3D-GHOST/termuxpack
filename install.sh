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
mkdir tools
cd tools/
git clone --depth=1 https://github.com/htr-tech/zphisher.git
git clone https://github.com/R3D-GHOST/Scan-Nmap.git
git clone https://github.com/jaykali/maskphish.git
git clone https://github.com/abhinavkavuri/PhoneInfoga

# Configuración de PhoneInfoga
cd PhoneInfoga
mv config.example.py config.py
python3 -m pip install -r requirements.txt
chmod +x *

# Volver al directorio home y configuración del script de inicio
cd ~
clear
echo "cd termuxpack/ ; sh menu.sh ;" > start.sh
chmod +x start.sh

# Configurar start.sh para que se ejecute al iniciar una nueva sesión
for shell_rc in ~/.bashrc ~/.zshrc; do
    if [ -f $shell_rc ]; then
        echo "if [ -f ~/start.sh ]; then ~/start.sh; fi" >> $shell_rc
    fi
done

echo "Instalación completa. Para iniciar, ejecuta './start.sh'"
