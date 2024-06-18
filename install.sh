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

# Aquí va el contenido actual de tu script install.sh

# Ruta al script menu.sh
MENU_SCRIPT_PATH="~/path/to/menu.sh"

# Asegúrate de que menu.sh tenga permisos de ejecución
chmod +x "$MENU_SCRIPT_PATH"

# Añadir `menu.sh` al inicio de bash (en ~/.bashrc)
if ! grep -Fxq "bash $MENU_SCRIPT_PATH" ~/.bashrc; then
    echo "bash $MENU_SCRIPT_PATH" >> ~/.bashrc
fi

# Añadir `menu.sh` al inicio de zsh (en ~/.zshrc)
if ! grep -Fxq "bash $MENU_SCRIPT_PATH" ~/.zshrc; then
    echo "bash $MENU_SCRIPT_PATH" >> ~/.zshrc
fi

# Ejecutar `menu.sh` al finalizar `install.sh`
bash "$MENU_SCRIPT_PATH"
