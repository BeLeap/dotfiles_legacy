import os

def system_prod(command):
    os.system(command + " > /dev/null 2>&1")
