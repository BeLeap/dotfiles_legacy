#!/usr/bin/python3
import platform
import os
import getpass

from install.spinner import Spinner

def check_linux_distro():
    try:
        file = open("/etc/issue", "r")
        os_distro = file.read()
        os_distro_arr = os_distro.split()
        return os_distro_arr
    except:
        return "N/A"

def install_dependencies(password):
    dependencies = [
        'fish',
        'tmux',
        'vim-gtk',
        'git',
        'curl',
        'make',
        'trash-cli',
        'fzf',
        'cargo',
        'cmake',
        'ccls',
        'clang'
    ]
    for dependency in dependencies:
        os.system(f"echo {password} | sudo -S apt install {dependency} -y > /dev/null 2>&1")

print("[CHECK] OS")
linux_distro = check_linux_distro()
if linux_distro[0] == 'Ubuntu' and linux_distro[1] == '20.04':
    print(linux_distro[0], linux_distro[1], "detected")
else:
    print("Your OS is not supported currently.")
    exit(1)

print("This script requires root permissions.")
print("Please insert your password to run sudo.")
password = getpass.getpass(prompt = '>> ')

print("[UPDATE] Running pacakge manager update.")
with Spinner():
    os.system(f"echo {password} | sudo -S apt update > /dev/null 2>&1")
print("[UPGRADE] Running package manager upgrade.")
with Spinner():
    os.system(f"echo {password} | sudo -S apt upgrade -y > /dev/null 2>&1")

print("[INSTALL] Installing required dependencies.")
with Spinner():
    install_dependencies(password)

print("[CALL] Fish configuration setup")
