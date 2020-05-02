import os

from .print import print_header
from .error import print_failed, print_succeed, check_success
from .password import get_home
from .spinner import Spinner

def link_tmux_conf(dotdir, homedir):
    print_header("LINK", "Linking tmux configuration file")
    try:
        os.symlink(dotdir + "/tmux/.tmux.conf", homedir + ".tmux.conf")
    except:
        try:
            os.remove(homedir + ".tmux.conf")
            os.symlink(dotdir + "/tmux/.tmux.conf", homedir + "/.tmux.conf")
        except:
            print_failed()
    print_succeed()

def install_tpm():
    res = os.system("git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm")
    check_success(res)

def install_tpm_plugins():
    res = os.system("tinstall | fish")
    check_success(res)

def setup():
    homedir = get_home()
    dotdir = os.getcwd()
    with Spinner():
        link_tmux_conf(dotdir, homedir)
    with Spinner():
        install_tpm()
    with Spinner():
        install_tpm_plugins()
