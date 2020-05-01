from .bcolor import bcolors

def print_header(header, msg):
    print(bcolors.HEADER + "[" + header + "] " + bcolors.ENDC + msg)
