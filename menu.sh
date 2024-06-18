#!/bin/bash

function ip() {
    clear
    echo ""
    read -p "Coloca la IP: " ip_address
    echo "" 
    echo "Currency: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=currency)" 
    echo "Currency Rates: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=currency_rates)" 
    echo "Currency Symbol: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=currency_symbol)" 
    echo "Country neighbours: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=country_neighbours)" 
    echo "Country phone: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=country_phone)" 
    echo "Country capital: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=country_capital)" 
    echo "Country code: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=country_code)" 
    echo "Currency Code: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=currency_code)" 
    echo ""
    echo "ISP: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=isp)" 
    echo "IP address type: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=type)" 
    echo ""
    echo "City: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=city)" 
    echo "Region: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=region)" 
    echo ""
    echo "Longitude: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=longitude)" 
    echo "Latitude: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=latitude)" 
    echo ""
    echo "Timezone name: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=timezone_name)" 
    echo "Timezone: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=timezone)" 
    echo ""
    echo "Organisation: $(curl -sS http://ipwhois.app/line/${ip_address}?objects=org)" 
    echo ""
}

function PhoneInfoga() {
    clear
    echo "Coloca el numero de telefono Ejemplo +34XXXXXXXX"
    read -p ">>> " numero
    cd PhoneInfoga
    python3 phoneinfoga.py -n "$numero"
}

function webscan() {
    clear
    echo "Pon la url de la web"
    read -p ">>> " url
    clear
    host "$url"
    echo ""
    echo "Pon la ip de la web"
    read -p ">>> " ipweb
    clear
    whois "$ipweb"
}

function nmap() {
    cd Scan-Nmap
    sh scan.sh
}

function phis() {
    cd zphisher
    bash zphisher.sh
}

function osint() {
    clear
    echo "Coloca el nombre o nick"
    echo "si el nombre completo nombreapellido1apellido2"
    echo "va todo junto."
    sleep 5
    echo ""
    echo ""
    read -p ":" nick
    sleep 1
    clear
    sudo maigret -a "$nick"
}

function ddos() {
    clear
    echo ""
    sleep 1
    echo "Inserta URL de la WEB con HTTP/HTTPS"
    echo ""
    read -p ">>> " url
    clear
    slowhttptest -R -u "$url" -c 1000 -a 10 -b 3000 -r 500
}

function mask() {
    cd maskphish
    bash maskphish.sh
}

function menu() {
    clear
    echo "Creador By R3DGHOST"
    echo "BETA 1"
    echo ""
    echo ""
    echo "[+] ------------------------- [+]"
    echo ""
    echo ""
    echo "[+] 1 ---> Nmap"
    echo ""
    echo "[+] 2 ---> Phishing "
    echo ""
    echo "[+] 3 ---> Acortar Enlaces"
    echo ""
    echo "[+] 4 ---> Phoneinfoga"
    echo ""
    echo "[+] 5 ---> Osint"
    echo ""
    echo "[+] 6 ---> IP info"
    echo ""
    echo "[+] 7 ---> Update"
    echo ""
    echo "[+] ------------------------- [+]"
    echo ""
    echo ""
    echo ""
    read -p ": " menu

    case $menu in
        1) nmap ;;
        2) phis ;;
        3) mask ;;
        4) PhoneInfoga ;;
        5) osint ;;
        6) ip ;;
        7) update.sh ;; 
        *) echo "Opción no válida" ;;
    esac
}

menu
