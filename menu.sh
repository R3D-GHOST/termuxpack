#!/bin/bash

clear_screen() {
    clear
}

get_ip_info() {
    clear_screen
    read -p "Coloca la IP: " ip_address
    fields=(
        "currency" "currency_rates" "currency_symbol" "country_neighbours"
        "country_phone" "country_capital" "country_code" "currency_code"
        "isp" "type" "city" "region" "longitude" "latitude"
        "timezone_name" "timezone" "org"
    )
    for field in "${fields[@]}"; do
        response=$(curl -s "http://ipwhois.app/line/$ip_address?objects=$field")
        echo "$(echo "$field" | tr '_' ' ' | awk '{print toupper(substr($0,1,1))tolower(substr($0,2))}'): $response"
    done
}

phone_infoga() {
    clear_screen
    read -p "Coloca el numero de telefono Ejemplo +34XXXXXXXX: " numero
    cd ~/termuxpack/PhoneInfoga || exit
    python3 phoneinfoga.py -n "$numero"
}

web_scan() {
    clear_screen
    read -p "Pon la url de la web: " url
    clear_screen
    host "$url"
    read -p "Pon la ip de la web: " ipweb
    clear_screen
    whois "$ipweb"
}

nmap_scan() {
    cd ~/termuxpack/Scan-Nmap || exit
    sh scan.sh
}

phishing() {
    cd ~/termuxpack/zphisher || exit
    bash zphisher.sh
}

osint() {
    clear_screen
    echo "Coloca el nombre o nick"
    echo "si el nombre completo nombreapellido1apellido2"
    echo "va todo junto."
    sleep 5
    read -p ": " nick
    clear_screen
    sudo maigret -a "$nick"
}

mask() {
    cd ~/termuxpack/maskphish || exit
    bash maskphish.sh
}

menu() {
    clear_screen
    echo "Creador By R3DGHOST"
    echo ""
    echo "[+] ------------------------- [+]"
    echo "[+] 1 ---> Nmap"
    echo "[+] 2 ---> Phishing"
    echo "[+] 3 ---> Acortar Enlaces"
    echo "[+] 4 ---> Phoneinfoga"
    echo "[+] 5 ---> Osint"
    echo "[+] 6 ---> IP info"
    echo "[+] 7 ---> Update"
    echo "[+] ------------------------- [+]"
    echo ""
    read -p ": " menu_option

    case "$menu_option" in
        1) nmap_scan ;;
        2) phishing ;;
        3) mask ;;
        4) phone_infoga ;;
        5) osint ;;
        6) get_ip_info ;;
        7) bash ~/termuxpack/update.sh ;;
        *) echo "Opción no válida" ;;
    esac
}

menu
