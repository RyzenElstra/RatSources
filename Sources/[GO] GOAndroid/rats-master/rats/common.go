package rats

import (
	"archive/zip"
	"fmt"
	"github.com/wmbest2/android/adb"
	"github.com/wmbest2/android/apk"
	"io"
	"io/ioutil"
	"log"
	"os"
	"sync"
	"time"
)

func RunOnDevice(wg *sync.WaitGroup, d adb.Transporter, params ...[]string) {
	defer wg.Done()
	for _, cmd := range params {
		adb.ShellSync(d, cmd...)
	}
}

func RunOn(devices []*Device, params ...[]string) {
	var wg sync.WaitGroup
	for _, d := range devices {
		wg.Add(1)
		go RunOnDevice(&wg, d, params...)
	}
	wg.Wait()
}

func RunOnAll(params ...string) {
	RunOn(<-GetAllDevices(), params)
}

func Unlock(devices []*Device) {
	var wg sync.WaitGroup
	for _, device := range devices {
		wg.Add(1)
		go func(d *Device) {
			d.Device.SetScreenOn(false)
			<-time.After(1 * time.Second)
			d.Device.SetScreenOn(true)
			<-time.After(1 * time.Second)
			d.Device.Unlock()
			<-time.After(1 * time.Second)
			wg.Done()
		}(device)
	}
	wg.Wait()
}

func Install(name string, f io.Reader, devices ...*Device) {
	loc := fmt.Sprintf("/sdcard/tmp/%s", name)

	d := make([]*adb.Device, 0, len(devices))
	for _, t := range devices {
		d = append(d, &t.Device)
	}

	err := adb.PushToDevices(d, f, os.ModeTemporary, uint32(time.Now().Unix()), loc)
	if err != nil {
		fmt.Println(err)
	}

	RunOn(devices, []string{"pm", "install", "-r", loc}, []string{"rm", loc})
}

func Uninstall(pack string, devices ...*Device) {
	RunOn(devices, []string{"pm", "uninstall", pack})
}

func GetFileFromZip(file io.ReaderAt, size int64, subFile string) []byte {
	r, err := zip.NewReader(file, size)
	if err != nil {
		log.Fatal(err)
	}

	// Iterate through the files in the archive,
	// printing some of their contents.
	for _, f := range r.File {
		if f.Name == subFile {
			var body []byte
			rc, err := f.Open()
			if err != nil {
				log.Fatal(err)
			}
			body, err = ioutil.ReadAll(rc)
			if err != nil {
				log.Fatal(err)
			}
			rc.Close()

			return body
		}
	}
	return []byte{}
}

func GetManifest(file io.ReaderAt, size int64) *apk.Manifest {
	var manifest apk.Manifest

	body := GetFileFromZip(file, size, "AndroidManifest.xml")
	err := apk.Unmarshal([]byte(body), &manifest)

	if err != nil {
		fmt.Printf("error: %v", err)
		return nil
	}

	return &manifest
}
