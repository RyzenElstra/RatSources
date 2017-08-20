import base64
import plistlib
import urllib2
import sys
from xml.etree import ElementTree as ET


def dsid_factory(username, password):
    credentials = base64.b64encode("{0}:{1}".format(username, password))
    url = "https://setup.icloud.com/setup/authenticate/{0}".format(username)
    headers = {
        "Authorization": "Basic {0}".format(credentials),
        "Content-Type": "application/xml",
    }
    request = urllib2.Request(url, None, headers)

    try:
        response = urllib2.urlopen(request)
    except urllib2.HTTPError as e:
        if e.code != 200:
            if e.code == 401:
                return "Error 401: Unauthorized, are you sure the credentials are correct?"
            elif e.code == 409:
                return "Error 409: 2FA enabled, MMeAuthToken required."
            elif e.code == 404:
                return "Error 404: URL not found, did you enter a username?"
            else:
                return "Error %s." % e.code
        else:
            print e
            raise urllib2.HTTPError

    content = response.read()

    dsid = int(plistlib.readPlistFromString(content)["appleAccountInfo"]["dsPrsID"])
    token = plistlib.readPlistFromString(content)["tokens"]["mmeAuthToken"]
    return dsid, token


def get_card_links(dsid, token):
    url = "https://p04-contacts.icloud.com/{0}/carddavhome/card".format(dsid)
    headers = {
        "Depth": "1",
        "Authorization": "X-MobileMe-AuthToken {0}".format(base64.b64encode("{0}:{1}".format(dsid, token))),
        "Content-Type": "text/xml",
    }
    data = """<?xml version="1.0" encoding="UTF-8"?>
    <A:propfind xmlns:A="DAV:">
      <A:prop>
        <A:getetag/>
      </A:prop>
    </A:propfind>
    """

    request = urllib2.Request(url, data, headers)
    request.get_method = lambda: 'PROPFIND'

    response = urllib2.urlopen(request)
    zebra = ET.fromstring(response.read())
    returned_data = """<?xml version="1.0" encoding="UTF-8"?>
    <F:addressbook-multiget xmlns:F="urn:ietf:params:xml:ns:carddav">
      <A:prop xmlns:A="DAV:">
        <A:getetag/>
        <F:address-data/>
      </A:prop>\n"""

    for response in zebra:
        for link in response:
            href = response.find('{DAV:}href').text  # Get each link in the tree
        returned_data += "<A:href xmlns:A=\"DAV:\">{0}</A:href>\n".format(href)
    return "{0}</F:addressbook-multiget>".format(str(returned_data))


def get_contacts(dsid, token):
    url = "https://p04-contacts.icloud.com/{0}/carddavhome/card".format(dsid)
    headers = {
        "Content-Type": "text/xml",
        "Authorization": "X-MobileMe-AuthToken {0}".format(base64.b64encode("{0}:{1}".format(dsid, token))),
    }
    data = get_card_links(dsid, token)

    request = urllib2.Request(url, data, headers)
    request.get_method = lambda: "REPORT"

    response = urllib2.urlopen(request)
    zebra = ET.fromstring(response.read())

    cards = []
    for response in zebra:
        tel, email = [], []
        name = ""
        vcard = response.find('{DAV:}propstat').find('{DAV:}prop').find('{urn:ietf:params:xml:ns:carddav}address-data').text
        if vcard:
            # print "-------------------------"

            for y in vcard.splitlines():
                # print y

                if y.startswith("FN:"):
                    name = y[3:]
                if y.startswith("TEL;"):
                    tel.append((y.split("type")[-1].split(":")[-1].replace("(", "").replace(")", "").replace(" ", "").replace("-", "").encode("ascii", "ignore")))
                if y.startswith("EMAIL;") or y.startswith("item1.EMAIL;"):
                    email.append(y.split(":")[-1])
            cards.append(([name], tel, email))
    return sorted(cards)

if __name__ == '__main__':
    username = sys.argv[1]
    password = sys.argv[2]

    token = dsid_factory(username, password)

    try:
        (dsid, token) = dsid_factory(username, password)
    except ValueError:
        # Error, print error message
        print token
        sys.exit()

    for contact in get_contacts(dsid, token):
        data = "\"{0}\": ".format(contact[0][0])
        phone_numbers = contact[1]
        emails = contact[2]

        if phone_numbers:
            data += "["
            current_count = 1

            for number in phone_numbers:
                data += number

                if current_count != len(phone_numbers):
                    data += ", "
                current_count += 1
            data += "]"

        if emails:
            if phone_numbers:
                data += ", ["
            else:
                data += "["

            current_count = 1

            for email in emails:
                data += email

                if current_count != len(emails):
                    data += ", "
                current_count += 1
            data += "]"

        print data
