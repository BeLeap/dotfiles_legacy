import subprocess
import getpass
FAIL = 'Password: \r\nsu: Authentication failure'

def validate_pass(password):
    ret = 0
    try:
        cmd = '{ sleep 1; echo "%s"; } | script -q -c "su -l root -c ls /root" /dev/null' % password
        ret = subprocess.check_output(cmd, shell=True)
        return ret
    except:
        return 1

def get_passwd():
    password = getpass.getpass(prompt='Password: ', stream=None)
    res = validate_pass(password).strip()
    if FAIL == res:
        print(res)
        print("[ERROR] INVALID PASSWORD")
    else:
        return password
