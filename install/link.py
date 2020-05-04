import os

from .print import print_header
from .error import print_failed, print_succeed, check_success
from .password import get_home
from .spinner import Spinner

def link_tmux(homedir, dotdir):
    try:
        print_header("LINK", "Linking tmux configuration file")
        os.symlink(dotdir + "/tmux/.tmux.conf", homedir + "/.tmux.conf")
    except:
        try:
            print_header("REMOVE", "Removing tmux configuration file")
            os.remove(homedir + "/.tmux.conf")
            print_header("LINK", "Linking tmux configuration file")
            os.symlink(dotdir + "/tmux/.tmux.conf", homedir + "/.tmux.conf")
        except:
            print_failed()
    print_succeed()
    
def link_vim(homedir, dotdir):
    try:
        print_header("LINK", "Linking vim configuration file")
        os.symlink(dotdir + "/vim/.vimrc", homedir + "/.vimrc")
    except:
        try:
            print_header("REMOVE", "Removing vim configuration file")
            os.remove(homedir + "/.vimrc")
            print_header("LINK", "Linking vim configureation file")
            os.symlink(dotdir + "/vim/.vimrc", homedir + "/.vimrc")
        except:
            print_failed()
    print_succeed()
    os.system("vim +PlugInstall +qall")
        
def link_fish(homedir, dotdir):
    try:
        print_header("LINK", "Linking fish configuration file")
        os.symlink(dotdir + "/fish/config.fish", homedir + "/.config/fish/fish.conf")
    except:
        print_failed()
    print_succeed()
    os.system("tinstall | fish")
    os.system("curl -L https://get.oh-my.fish | fish")
    os.system("fish -c \"omf install agnoster\"")
    os.system("curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash")
    os.system("fish -c \"omf install nvm\"")

def link():
    homedir = get_home()
    dotdir = os.getcwd()
    link_tmux(homedir, dotdir)
    link_vim(homedir, dotdir)
    link_fish(homedir, dotdir)
