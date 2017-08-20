[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0) ![](https://img.shields.io/badge/platform-macOS%20%2F%20OS%20X-blue.svg)
# EvilOSX
EvilOSX is a pure python, post-exploitation, RAT (Remote Administration Tool) for macOS / OSX.

## Features
* Emulate a simple terminal instance.
* Sockets are encrypted with [CSR](https://en.wikipedia.org/wiki/Certificate_signing_request#Procedure) via OpenSSL.
* No dependencies (pure python).
* Persistence.
* Retrieve Chrome passwords.
* Retrieve iCloud contacts.
* Attempt to get iCloud password via [phishing](http://i.imgur.com/wEqF5aa.png).
* Show local iOS backups.
* Download and upload files.
* Retrieve find my iphone devices.
* Attempt to get root via local privilege escalation (<= 10.10.5).
* Auto installer, simply run EvilOSX on the target and the rest is handled automatically.

## Usage
1. Download or clone this repository.
2. Run ./BUILDER and enter the appropriate information: <br/>
   ![](http://i.imgur.com/NQRPFXS.png)
3. Done! Upload and execute the built EvilOSX on your target (with ./EvilOSX.py).
4. Finally, start the Server (with ./Server.py) and start managing connections: <br/>
   ![](http://i.imgur.com/CafyVrZ.png)

## Thanks
* [OSXChromeDecrypt](https://github.com/manwhoami/OSXChromeDecrypt)  created by manwhoami
* [MMeTokenDecrypt](https://github.com/manwhoami/MMeTokenDecrypt) created by manwhoami
* [iCloudContacts](https://github.com/manwhoami/iCloudContacts) created by manwhoami