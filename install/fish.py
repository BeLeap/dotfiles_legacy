import os

from .spinner import Spinner
from .print import print_header
from .password import get_home
from .error import print_succeed, print_failed, check_success

def create_config_dir(homedir):
    print_header("CREATE", "Creating fish configuration direcotry.")
    try:
        os.makedirs(homedir + '/.config/fish')
    except:
        print_failed()
    print_succeed()

def link_fish_conf(dotdir, homedir):
    print_header("LINK", "Linking fish configuration file")
    try:
        os.symlink(dotdir + "/fish/config.fish", homedir + "/.config/fish/config.fish")
    except:
        try:
            os.remove(dotdir + "/.config/fish/config.fish")
            os.symlink(dotdir + "/fish/config.fish", homedir + "/.config/fish/config.fish")
        except:
            print_failed()
    print_succeed()

def cargo_install(homedir):
    cargo_dependency_list = [
        'exa',
        'ripgrep',
        'hexyl',
        'bat',
        'fd-find'
    ]
    cargo_dependency = " ".join(cargo_dependency_list)
    print("INSTALL", cargo_dependency + " using cargo")
    res = os.system("cargo install " + cargo_dependency)
    check_success(res)
    res = os.system("set -U fish_user_paths " + homedir + "/.cargo/bin | fish")
    check_success(res)

def omf_install():
    print_header("INSTALL", "oh-my-fish using curl")
    res = os.system("curl -L https://get.oh-my.fish | fish")
    check_success(res)

def nvm_install():
    print_header("INSTALL", "nvm using curl")
    res = os.system("curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash")
    check_success(res)
    print_header("INSTALL", "nvm using omf for fish")
    res = os.system("fish -c \"omf install nvm\"")
    check_success(res)

def change_shell(password):
    print_header("REGISTER", "fish shell")
    res = os.system(f"echo {password} | chsh -s /usr/bin/fish")
    check_success(res)

def setup(password):
    homedir = get_home()
    print("homedir:", homedir)
    dotdir = os.getcwd()
    print("dotdir:", dotdir)
    with Spinner():
        create_config_dir(homedir)
    with Spinner():
        link_fish_conf(dotdir, homedir)
    with Spinner():
        cargo_install(homedir)
    with Spinner():
        omf_install()
    with Spinner():
        nvm_install()
    with Spinner():
        change_shell(password)
