package main

import (
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"github.com/GeertJohan/go.rice"
	"github.com/gorilla/mux"
	"github.com/wmbest2/android/adb"
	"github.com/wmbest2/rats-server/rats"
	"github.com/wmbest2/rats-server/test"
	"labix.org/v2/mgo"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"
	"time"
)

var (
	mgoSession *mgo.Session

	mongodb = flag.String("db", "mongodb://localhost/rats", "Mongo db url")
	port    = flag.Int("port", 3000, "Port to serve")
	debug   = flag.Bool("debug", false, "Log debug information")

	adb_address = flag.String("adb_address", "localhost", "Address of ADB server")
	adb_port    = flag.Int("adb_port", 5037, "Port of ADB server")
)

type RatsHandler func(http.ResponseWriter, *http.Request, *mgo.Database) error

type PageMeta struct {
	Page  int `json:"page"`
	Count int `json:"count"`
	Total int `json:"total"`
}

func (rh RatsHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	s := mgoSession.Clone()
	defer s.Close()

	err := rh(w, r, s.DB("rats"))
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}

func RunTests(w http.ResponseWriter, r *http.Request, db *mgo.Database) error {
	uuid, err := uuid()
	if err != nil {
		return err
	}
	main, _, err := r.FormFile("apk")
	testApk, _, err := r.FormFile("test-apk")
	if err != nil {
		return errors.New("A Test Apk must be supplied")
	}

	size := getLength(testApk)

	count, _ := strconv.Atoi(r.FormValue("count"))
	serialList := r.FormValue("serials")
	strict := r.FormValue("strict")
	msg := r.FormValue("message")

	var serials []string
	if serialList != "" {
		serials = strings.Split(serialList, ",")
	}

	filter := &rats.DeviceFilter{
		Count:  count,
		Strict: strict == "true",
	}
	filter.Serials = serials

	manifest := rats.GetManifest(testApk, size)
	filter.MinSdk = manifest.Sdk.Min
	filter.MaxSdk = manifest.Sdk.Max

	testApk.Seek(0, 0) // reset for new reader

	devices := <-rats.GetDevices(filter)
	rats.Reserve(devices...)

	// Remove old if left over
	rats.Uninstall(manifest.Package, devices...)
	rats.Uninstall(manifest.Instrument.Target, devices...)

	// Install New
	if main != nil {
		rats.Install("main.apk", main, devices...)
	}
	rats.Install("test.apk", testApk, devices...)

	rats.Unlock(devices)

	finished, out := test.RunTests(manifest, devices)

	var s *test.TestSuites
SuitesLoop:
	for {
		select {
		case s = <-out:
			break SuitesLoop
		case device := <-finished:
			go func() {
				rats.Uninstall(manifest.Package, device)
				rats.Uninstall(manifest.Instrument.Target, device)
				rats.Release(device)
			}()
		}
	}

	s.Name = uuid
	s.Timestamp = time.Now()
	s.Project = manifest.Instrument.Target
	if msg != "" {
		s.Message = msg
	}

	if dbErr := db.C("runs").Insert(&s); dbErr != nil {
		w.WriteHeader(http.StatusConflict)
		json.NewEncoder(w).Encode(dbErr.Error())
	}

	if !s.Success {
		w.WriteHeader(http.StatusInternalServerError)
	}

	return json.NewEncoder(w).Encode(s)
}

func GetDevices(w http.ResponseWriter, r *http.Request, db *mgo.Database) error {
	return json.NewEncoder(w).Encode(<-rats.GetAllDevices())
}

func PingHandler(w http.ResponseWriter, r *http.Request, db *mgo.Database) error {
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "pong")

	return nil
}

func init() {
	flag.Parse()

	var err error
	mgoSession, err = mgo.Dial(*mongodb)
	if err != nil {
		log.Fatal(err)
	}
}

func tryStartAdb() {
	path := os.ExpandEnv("$ANDROID_HOME")
	if path != "" {
		path = filepath.Join(path, "platform-tools", "adb")
		b, err := exec.Command(path, "start-server").CombinedOutput()
		if err != nil {
			fmt.Println(err)
		} else {
			fmt.Println(string(b))
		}
	}
}

func refreshDevices(a *adb.Adb, inRecover bool) {
	defer func() {
		if e := recover(); e != nil {
			if !inRecover && a == adb.Default {
				fmt.Println("Couldn't connect to adb, attempting to recover")
				tryStartAdb()
				refreshDevices(a, true)
			} else if inRecover {
				fmt.Println("Still couldn't connect.  Make sure adb exists in $ANDROID_HOME\n\tor manually start it with 'adb start-server'")
				os.Exit(2)
			} else {
				fmt.Println(e)
				os.Exit(2)
			}
		}
	}()
	rats.UpdateAdb(a)
}

func main() {
	conn := adb.Default
	if *adb_address != "localhost" || *adb_port != 5037 {
		conn = adb.Connect(*adb_address, *adb_port)
	}
	go refreshDevices(conn, false)

	r := mux.NewRouter()

	r.Handle("/api/ping", RatsHandler(PingHandler))
	r.Handle("/api/devices", RatsHandler(GetDevices))
	r.Handle("/api/run", RatsHandler(RunTests))
	r.Handle("/api/runs", RatsHandler(GetRuns))
	r.Handle("/api/runs/{id}", RatsHandler(GetRun))
	r.Handle("/api/runs/{id}/{device}", RatsHandler(GetRunDevice))
	r.PathPrefix("/").Handler(http.FileServer(rice.MustFindBox(`public`).HTTPBox()))

	http.Handle("/", r)

	log.Printf("Listening on port %d\n", *port)
	if err := http.ListenAndServe(fmt.Sprintf(":%d", *port), nil); err != nil {
		log.Fatalf("Error starting server: %s\n", err.Error())
	}
}
