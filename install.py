#!/usr/bin/python3
from install.bcolor import bcolors
from install.check_os import get_linux_distro, check_supported
from install.password import get_passwd
from install.apt import update, upgrade, install_dependencies

from install import fish

print(bcolors.HEADER + "[CHECK]" + bcolors.ENDC + " OS")
linux_distro = get_linux_distro()
if check_supported(linux_distro) == False:
    exit(1)

print("This script requires root permissions.")
print("Please insert your password to run sudo.")
password = get_passwd()

print(bcolors.HEADER + "[UPDATE]" + bcolors.ENDC + " Running pacakge manager update.")
update(password)

print(bcolors.HEADER + "[UPGRADE]"+ bcolors.ENDC + " Running package manager upgrade.")
upgrade(password)

print(bcolors.HEADER + "[INSTALL]" + bcolors.ENDC + " Installing required dependencies.")
install_dependencies(password)

print(bcolors.HEADER + "[CALL]" + bcolors.ENDC + " Fish configuration setup")
fish.setup(password)
