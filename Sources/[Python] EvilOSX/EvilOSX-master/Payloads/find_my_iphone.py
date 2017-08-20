import datetime
import time
import base64
import urllib2
import json
import sys


def get_location(latitude, longitude):
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng={0},{1}".format(latitude, longitude)
    headers = {"Content-Type": "application/json"}
    request = urllib2.Request(url, None, headers)

    try:
        response = urllib2.urlopen(request)
    except urllib2.HTTPError as ex:
        if ex.code != 200:
            return "HTTP Error: {0}".format(ex.code)
        else:
            print ex
            raise urllib2.HTTPError

    formatted_address = json.loads(response.read())["results"][0]["formatted_address"]
    return formatted_address.encode("ascii", "ignore")


def print_devices(username, password):
    i = 0

    try:
        # FMIP token specified, change auth type
        int(username)
        auth_type = "Forever"
    except ValueError:
        # Normal Apple ID
        auth_type = "UserIDGuest"

    while True:
        i += 1

        url = "https://fmipmobile.icloud.com/fmipservice/device/{0}/initClient".format(username)
        headers = {
            "X-Apple-Realm-Support": "1.0",
            "Authorization": "Basic {0}".format(base64.b64encode("{0}:{1}".format(username, password))),
            "X-Apple-Find-API-Ver": "3.0",
            "X-Apple-AuthScheme": "{0}".format(auth_type),
            "User-Agent": "FindMyiPhone/500 CFNetwork/758.4.3 Darwin/15.5.0",
        }

        request = urllib2.Request(url, None, headers)
        request.get_method = lambda: "POST"

        try:
            response = urllib2.urlopen(request)
            z = json.loads(response.read())
        except urllib2.HTTPError as e:
            if e.code == 401:
                print "Error 401: Invalid credentials."
            if e.code == 403:
                pass
            raise e

        if i == 2:  # Break out of while loop
            break

        time.sleep(5)  # Wait for iCloud to get results then go back to the beginning of the loop

    i = 0
    for y in z["content"]:
            model = str(y["deviceDisplayName"])
            name = str(y["name"].encode("ascii", "ignore"))

            try:
                latitude = y["location"]["latitude"]
                longitude = y["location"]["longitude"]

                battery_percent = str(float(y["batteryLevel"]) * 100).split(".")[0] + "%"
                battery_status = str(y["batteryStatus"]).replace("NotCharging", "Not charging")
                battery = "{0} ({1})".format(battery_percent, battery_status)

                time_stamp = y["location"]["timeStamp"] / 1000
                time_delta = time.time() - time_stamp  # Time difference in seconds
                minutes, seconds = divmod(time_delta, 60)  # Great function, saves annoying maths
                hours, minutes = divmod(minutes, 60)
                time_stamp = datetime.datetime.fromtimestamp(time_stamp).strftime("%A, %B %d at %I:%M:%S")

                if hours > 0:
                    time_stamp = "%s (%sh %sm %ss ago)" % (time_stamp, str(hours).split(".")[0], str(minutes).split(".")[0], str(seconds).split(".")[0])
                else:
                    time_stamp = "%s (%sm %ss ago)" % (
                    time_stamp, str(minutes).split(".")[0], str(seconds).split(".")[0])

                print "Device: {0}".format(name)
                print "Model: {0}".format(model)
                print "Coordinates: {0}, {1}".format(latitude, longitude)
                print "Street Address: {0}".format(get_location(latitude, longitude))
                print "Battery: {0}".format(battery)
                print "Last Seen: {0}".format(time_stamp)
            except TypeError:  # No latitude / longitude
                print "Device: {0}".format(name)
                print "Model: {0}".format(model)

            i += 1
            if i != len(z["content"]):
                print "-" * 15


if __name__ == '__main__':
    username = sys.argv[1]  # Username
    password = sys.argv[2]  # Password

    print_devices(username, password)
