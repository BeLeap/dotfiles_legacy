import os

from .spinner import Spinner
from .print import print_header
from .password import get_home
from .error import print_succeed, print_failed, check_success

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
        cargo_install(homedir)
    with Spinner():
        change_shell(password)
