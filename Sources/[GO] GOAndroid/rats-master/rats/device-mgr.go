package rats

import (
	"errors"
	"fmt"
	"github.com/wmbest2/android/adb"
	"sync"
	"time"
)

var devices map[string]*Device
var lock sync.Mutex

type Device struct {
	adb.Device
	InUse bool
}

type DeviceGroup struct {
	Name string
	adb.DeviceFilter
}

type DeviceFilter struct {
	adb.DeviceFilter
	Count  int
	Strict bool
}

func UpdateAdb(a *adb.Adb) error {
	for {
		var connected bool
		if a == nil {
			break
		}
		for d := range a.TrackDevices() {
			connected = true
			new_devices := a.ParseDevices(nil, d)

			lock.Lock()
			old_map := devices
			lock.Unlock()

			new_map := make(map[string]*Device)

			for _, d := range new_devices {
				if old_map[d.String()] != nil {
					new_map[d.String()] = devices[d.String()]
				} else {
					new_map[d.String()] = &Device{Device: *d, InUse: false}
				}
			}

			lock.Lock()
			devices = new_map
			lock.Unlock()
		}

		if !connected {
			panic(errors.New("Couldn't connect to adb"))
		} else {
			fmt.Println("Lost adb connection?!")
		}

		<-time.After(2 * time.Second)
	}
	return nil
}

func GetAllDevices() chan []*Device {
	return GetDevices(nil)
}

func GetDevices(filter *DeviceFilter) chan []*Device {
	out := make(chan []*Device)

	go func() {
		lock.Lock()
		v := make([]*Device, 0, len(devices))
		lock.Unlock()

		count := -1
		if filter != nil && filter.Count > 0 {
			count = filter.Count
		}
		for {
			lock.Lock()
			for _, value := range devices {
				if filter == nil || (value.MatchFilter(&filter.DeviceFilter)) && !value.InUse {
					v = append(v, value)
					if count > 1 {
						count--
					} else if count != -1 {
						break
					}
				}
			}
			lock.Unlock()

			if filter == nil || !filter.Strict || count == 0 {
				break
			}

			<-time.After(5 * time.Second)
		}

		out <- v
	}()
	return out
}

func Reserve(devices ...*Device) {
	lock.Lock()
	for _, value := range devices {
		value.InUse = true
	}
	lock.Unlock()
}

func Release(devices ...*Device) {
	lock.Lock()
	for _, value := range devices {
		value.InUse = false
	}
	lock.Unlock()
}
