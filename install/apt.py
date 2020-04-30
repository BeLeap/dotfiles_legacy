import os

from .spinner import Spinner

def update(password):
    with Spinner():
        os.system(f"echo {password} | sudo -S apt update > /dev/null 2>&1")

def upgrade(password):
    with Spinner():
        os.system(f"echo {password} | sudo -S apt upgrade -y > /dev/null 2>&1")

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
            os.system(f"echo {password} | sudo -S apt install {dependency} -y > /dev/null 2>&1")

