from .bcolor import bcolors

def print_succeed():
    print("\b" + bcolors.OKGREEN + "Executed Successfully." + bcolors.ENDC)

def print_failed():
    print("\b" + bcolors.FAIL + "Execution Failed" + bcolors.ENDC)
    exit(1)

def check_success(res):
    if res != 0:
        print_failed()
        print(res)
    else:
        print_succeed()

