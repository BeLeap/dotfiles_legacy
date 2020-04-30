#!/usr/bin/python3
import platform
import os
import getpass

from install.check_os import get_linux_distro, check_supported
from install.apt import update, upgrade, install_dependencies

print("[CHECK] OS")
linux_distro = get_linux_distro()
if check_supported(linux_distro) == False:
    exit(1)

print("This script requires root permissions.")
print("Please insert your password to run sudo.")
password = getpass.getpass(prompt = '>> ')

print("[UPDATE] Running pacakge manager update.")
update(password)
print("[UPGRADE] Running package manager upgrade.")
upgrade(password)
print("[INSTALL] Installing required dependencies.")
install_dependencies(password)
print("[CALL] Fish configuration setup")
