import os

from .spinner import Spinner
from .password import check_succeed

def update(password):
    with Spinner():
        res = os.system(f"echo {password} | sudo -S apt update > /dev/null 2>&1")
        check_succeed(res)

def upgrade(password):
    with Spinner():
        res = os.system(f"echo {password} | sudo -S apt upgrade -y > /dev/null 2>&1")
        check_succeed(res)

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
    with Spinner():
        for dependency in dependencies:
            res = os.system(f"echo {password} | sudo -S apt install {dependency} -y > /dev/null 2>&1")
            check_succeed(res)

