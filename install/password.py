import getpass

from .bcolor import bcolors

def get_passwd():
    password = getpass.getpass(prompt='Password: ', stream=None)
    return password

def check_succeed(res):
    if res != 0:
        print("\b" + bcolors.FAIL + "Execution Failed" + bcolors.ENDC)
        exit(1)
    else:
        print("\b" + bcolors.OKGREEN + "Executed Successfully." + bcolors.ENDC)
