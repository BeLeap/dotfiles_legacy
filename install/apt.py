import os

from .spinner import Spinner
from .error import check_success

def update(password):
    with Spinner():
        res = os.system(f"echo {password} | sudo -S apt update > /dev/null 2>&1")
        check_success(res)

def upgrade(password):
    with Spinner():
        res = os.system(f"echo {password} | sudo -S apt upgrade -y > /dev/null 2>&1")
        check_success(res)

def install_dependencies(password):
    dependency_list = [
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
    dependency = " ".join(dependency_list)
    with Spinner():
        res = os.system(f"echo {password} | sudo -S apt install {dependency} -y > /dev/null 2>&1")
        check_success(res)

