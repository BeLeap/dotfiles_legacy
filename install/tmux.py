import os

from .print import print_header
from .error import print_failed, print_succeed, check_success
from .spinner import Spinner

def install_tpm():
    res = os.system("git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null 2>&1")
    check_success(res)

def setup():
    with Spinner():
        install_tpm()
