
#
#
#
#
# POST INSTALL 
    echo "Instalando las herramientas de para tu termux"
    echo ""
    echo "By R3DGHOST - GHOSTRYZECOMPANY"
    sleep 3
    clear
    pkg update && pkg install git 
    pkg install python
    pkg install nmap
    pkg install tur-repo
    pkg install cloudflared
    mkdir tools
    cd tools/
    git clone --depth=1 https://github.com/htr-tech/zphisher.git
    pkg install slowhttptest
    git clone https://github.com/R3D-GHOST/Scan-Nmap.git
    git clone https://github.com/jaykali/maskphish.git
    pkg install whois
    pkg install host
    pkg install python3
    pkg install python2
    pip install maigret
    git clone https://github.com/abhinavkavuri/PhoneInfoga
    cd PhoneInfoga
    mv config.example.py config.py
    python3 -m pip install -r requirments.txt
    chmod +x *
    cd
    clear
    echo "termux-wake-lock ; shd ; cd ; cd termuxpack/ ; sh menu.sh ;" > start.sh
    chmod +x start.sh
