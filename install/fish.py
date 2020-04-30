import os

from .bcolor import bcolors
from .password import get_home
from .error import print_succeed, print_failed, check_success

def create_config_dir(homedir):
    print(bcolors.HEADER + "[CREATE]" + bcolors.ENDC + " Creating fish configuration direcotry")
    try:
        os.makedirs(homedir + '/.config/fish')
    except:
        print_failed()
    print_succeed()

def link_fish_conf(dotdir, homedir):
    print(bcolors.HEADER + "[LINK]" + bcolors.ENDC + " Linking fish configuration file")
    try:
        os.symlink(dotdir + "/fish/config.fish", homedir + "/.config/fish/config.fish")
    except:
        print_failed()
    print_succeed()

def cargo_install():
    cargo_dependency_list = [
        'exa',
        'ripgrep',
        'hexyl',
        'bat',
        'fd-find'
    ]
    cargo_dependency = " ".join(cargo_dependency_list)
    print(bcolors.HEADER + "[INSTALL]" + bcolors.ENDC + " " + cargo_dependency + " using cargo")
    res = os.system("cargo install " + cargo_dependency + " > /dev/null 2>&1")
    check_success(res)

def omf_install():
    print(bcolors.HEADER + "[INSTALL]" + bcolors.ENDC + " oh-my-fish using curl")
    res = os.system("curl -L https://get.oh-my.fish | fish > /dev/null 2>&1")
    check_success(res)

def nvm_install():
    print(bcolors.HEADER + "[INSTALL]" + bcolors.ENDC + " nvm using curl")
    res = os.system("curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash > /dev/null 2>&1")
    check_success(res)
    print(bcolors.HEADER + "[INSTALL]" + bcolors.ENDC + " nvm using omf for fish")
    res = os.system("fish -c \"omf install nvm\"")
    check_success(res)

def change_shell(password):
    print(bcolors.HEADER + "[REGISTER]" + bcolors.ENDC + " fish shell")
    res = os.system(f"echo {password} | chsh -s /usr/bin/fish")
    check_success(res)

def setup(password):
    homedir = get_home()
    currentdir = os.getcwd()
    dotdir = os.path.split(currentdir)[0]
    create_config_dir(homedir)
    link_fish_conf(dotdir, homedir)
    cargo_install()
    omf_install()
    nvm_install()
    change_shell(password)
