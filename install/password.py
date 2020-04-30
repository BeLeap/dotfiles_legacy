import getpass
import os

from .bcolor import bcolors

def get_passwd():
    password = getpass.getpass(prompt='Password: ', stream=None)
    return password

def get_home():
    homedir = os.environ['HOME']
    return homedir
