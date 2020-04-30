import getpass

def get_passwd():
    password = getpass.getpass(prompt='Password: ', stream=None)
    return password

def check_succeed(res):
    if res != 0:
        exit(1)
    else:
        print("Executed successfully.")
