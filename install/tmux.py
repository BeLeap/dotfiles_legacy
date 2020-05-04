import os

from .print import print_header
from .error import print_failed, print_succeed, check_success
from .password import get_home
from .spinner import Spinner

def install_tpm():
    res = os.system("git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm")
    check_success(res)

def install_tpm_plugins():
    res = os.system("tinstall | fish")
    check_success(res)

def setup():
    with Spinner():
        install_tpm()
    with Spinner():
        install_tpm_plugins()
