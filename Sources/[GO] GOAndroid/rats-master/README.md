RATS: Remote Android Test Service
-----

![Imgur](http://i.imgur.com/s9Dl1ih.png)

###What is RATS?
RATS is an easy to run Test Runner Service that can be hosted anywhere a device can be connected.  It was designed to thwart device hogs and provide a level playing field for shops who can't afford more expensive testing services.

It should be as simple to setup as it is to run thanks to the [gradle plugin](https://www.github.com/wmbest2/rats-gradle-plugin)

### Why Rats?
"RATS!" was what I anticipated our developers at [VOKAL Interactive](http://www.vokalinteractive.com) saying whenever their tests failed.

###Installation

Binaries:

1. Download the binary for your architecture and os from [here](https://github.com/wmbest2/rats-server/releases/latest)
2. Have a mongo database running (see [here](http://docs.mongodb.org/manual/installation/) for more information)
2. `rats-server_os_arch -port 8080 -db mongodb://somehost`


####But my FreeBSD machine cant run ADB!

Run rats with the `adb_address` and `adb_port` flags to point it to another machine!
Run all your server in the cloud and your devices on your desk!


### Run Your Tests

  `curl -X POST myserver.local:8080/api/run -F apk=@myapk.apk -F test-apk=@myapk-test.apk`

  _Seriously, that's it!_

  Parameters:

  * `apk` Main apk
  * `test-apk` Test package apk
  * `count` Number of devices
  * `serials` Comma separated list of device serials
  * `strict` Strict mode (will run forever if devices dont match)
  * `message` A description of the run

###Capabilities

* Concurrent Test Running on all devices requested
 * Devices are held only as long as the test runs freeing them up sooner for more testing
 * Active Device monitoring lets you see which devices are in use
* Filter Devices for a particular run
 * Device count filter so you don't piss off your coworkers 
 * Automatic SDK filtering based on manifest parameters
 * Strict filtering mode and Serial filters for cases where you must run a particular subset of devices
* Easy to use Api for extra info

###Gradle Plugin

[RATS Gradle Plugin](https://github.com/wmbest2/rats-gradle-plugin)

```groovy
buildscript {
    repositories {
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:0.10.+'
        classpath 'com.wmbest.gradle:rats:0.2.+'
    }
}

apply plugin: 'android'
apply plugin: 'rats'
```

###Whats Missing / What's to come

* Proper encoding for Accept headers (e.g. xml for proper junit output)
* Log capture from tests
* Screenshots
* Project Grouping
* Realtime test results
* Ironically: Tests

### Contributors
So far mostly me[(wmbest2)](http://www.github.com/wmbest2), but not without support from [VOKAL Interactive](http://www.vokalinteractive.com)

### Let's see more!

![Imgur](http://i.imgur.com/zEnBWu9.png)

![Imgur](http://i.imgur.com/oZsFNNG.png)

