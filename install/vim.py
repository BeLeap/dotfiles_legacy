import os

from .myprint import print_header
from .error import print_failed, print_succeed, check_success
from .spinner import Spinner

def install_vim_plug():
    print_header("INSTALL", "vim-plug using curl")
    res = os.system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1")
    check_success(res)

def setup():
    with Spinner():
        install_vim_plug()
