#!/usr/bin/python3
import argparse

from install import fish, tmux, vim, link, print, check_os, password, apt, command

from install.print import print_header
from install.check_os import get_linux_distro, check_supported
from install.password import get_passwd
from install.apt import update, upgrade, install_dependencies
from install.command import system_prod


parser = argparse.ArgumentParser(description='development')
parser.add_argument('--env', required=False, default='prod', help='Development ENV')

args = parser.parse_args()

print_header("CHECK", "OS")
linux_distro = get_linux_distro()
if check_supported(linux_distro) == False:
    exit(1)

password = 'test'
if args.env != 'dev':
    os.system = system_prod()
    print("This script requires root permissions.")
    print("Please insert your password to run sudo.")
    password = get_passwd()

print_header("UPDATE", "Running package manager update.")
update(password)

print_header("UPGRADE", "Running package manager upgrade.")
upgrade(password)

print_header("INSTALL", "Installing required dependencies.")
install_dependencies(password)

print_header("CALL", "Fish configuration setup")
fish.setup(password)

print_header("CALL", "Tmux configuration setup")
tmux.setup()

print_header("CALL", "Vim configuration setup")
vim.setup()

print_header("CALL", "Link configuration files")
link.link()
