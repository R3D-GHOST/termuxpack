import os
import requests
import subprocess
import time

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def get_ip_info():
    clear_screen()
    ip_address = input("Coloca la IP: ")
    fields = [
        "currency", "currency_rates", "currency_symbol", "country_neighbours", 
        "country_phone", "country_capital", "country_code", "currency_code", 
        "isp", "type", "city", "region", "longitude", "latitude", 
        "timezone_name", "timezone", "org"
    ]
    for field in fields:
        response = requests.get(f"http://ipwhois.app/line/{ip_address}?objects={field}")
        print(f"{field.replace('_', ' ').capitalize()}: {response.text.strip()}")

def phone_infoga():
    clear_screen()
    numero = input("Coloca el numero de telefono Ejemplo +34XXXXXXXX: ")
    os.system('cd PhoneInfoga')
    subprocess.run(['python3', 'phoneinfoga.py', '-n', numero])

def web_scan():
    clear_screen()
    url = input("Pon la url de la web: ")
    clear_screen()
    subprocess.run(['host', url])
    ipweb = input("Pon la ip de la web: ")
    clear_screen()
    subprocess.run(['whois', ipweb])

def nmap_scan():
    os.system('cd Scan-Nmap')
    subprocess.run(['sh', 'scan.sh'])

def phishing():
    os.system('cd zphisher')
    subprocess.run(['bash', 'zphisher.sh'])

def osint():
    clear_screen()
    print("Coloca el nombre o nick")
    print("si el nombre completo nombreapellido1apellido2")
    print("va todo junto.")
    time.sleep(5)
    nick = input(": ")
    clear_screen()
    subprocess.run(['sudo', 'maigret', '-a', nick])


def mask():
    os.system('cd maskphish')
    subprocess.run(['bash', 'maskphish.sh'])

def menu():
    clear_screen()
    print("Creador By R3DGHOST")
    print("BETA 1")
    print("[+] ------------------------- [+]")
    print("[+] 1 ---> Nmap")
    print("[+] 2 ---> Phishing")
    print("[+] 3 ---> Acortar Enlaces")
    print("[+] 4 ---> Phoneinfoga")
    print("[+] 5 ---> Osint")
    print("[+] 6 ---> IP info")
    print("[+] 7 ---> Update")
    print("[+] ------------------------- [+]")
    
    menu_option = input(": ")
    
    if menu_option == '1':
        nmap_scan()
    elif menu_option == '2':
        phishing()
    elif menu_option == '3':
        mask()
    elif menu_option == '4':
        phone_infoga()
    elif menu_option == '5':
        osint()
    elif menu_option == '6':
        get_ip_info()
    elif menu_option == '7':
        subprocess.run(['sh', 'update.sh'])
    else:
        print("Opción no válida")

if __name__ == "__main__":
    menu()
