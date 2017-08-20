package main

import (
	"encoding/xml"
	"fmt"
	"github.com/wmbest2/rats-server/rats"
	"github.com/wmbest2/rats-server/test"
	"os"
)

func main() {
	rats.PollDevices()

	argCount := len(os.Args)
	if argCount != 2 && argCount != 3 {
		fmt.Println("Usage: cli-client <main apk [optional]> <test apk>")
		fmt.Println("   * main apk not required for library tests")
		return
	}

	devices := <-rats.GetAllDevices()

	for _, arg := range os.Args[1:] {
		rats.Install(arg, devices)
	}

	for _, device := range devices {
		device.SetScreenOn(true)
		device.Unlock()
	}

	testFile := os.Args[len(os.Args)-1]
	manifest := rats.GetManifest(testFile)

	s := test.RunTests(manifest, devices)
	str, err := xml.Marshal(s)
	if err == nil {
		fmt.Println(string(str))
	}

	rats.Uninstall(manifest.Package, devices)
	rats.Uninstall(manifest.Instrument.Target, devices)
}
