import platform

def get_linux_distro():
    try:
        file = open("/etc/issue", "r")
        os_distro = file.read()
        os_distro_arr = os_distro.split()
        return os_distro_arr
    except:
        return "N/A"

def check_supported(distro):
    if distro[0] == 'Ubuntu' and distro[1] == '20.04':
        print(distro[0], distro[1], "detected.")
        return True
    else:
        print("Sorry, your os is not supported currently.")
        return False
