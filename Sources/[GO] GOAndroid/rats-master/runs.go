package main

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"github.com/wmbest2/rats-server/test"
	"labix.org/v2/mgo"
	"labix.org/v2/mgo/bson"
	"net/http"
	"strconv"
)

type RunsPage struct {
	Runs []*test.TestSuites `json:"runs"`
	Meta PageMeta           `json:"meta"`
}

func GetRunDevice(w http.ResponseWriter, r *http.Request, db *mgo.Database) error {
	vars := mux.Vars(r)

	var runs test.TestSuites
	q := bson.M{"name": vars["id"]}
	s := bson.M{"testsuites": bson.M{"$elemMatch": bson.M{"hostname": vars["device"]}}}
	query := db.C("runs").Find(q).Select(s).Limit(1)
	query.One(&runs)

	return json.NewEncoder(w).Encode(runs.TestSuites[0])
}

func GetRun(w http.ResponseWriter, r *http.Request, db *mgo.Database) error {
	vars := mux.Vars(r)

	var runs test.TestSuites
	query := db.C("runs").Find(bson.M{"name": vars["id"]}).Limit(1)
	query.One(&runs)

	return json.NewEncoder(w).Encode(runs)
}

func GetRuns(w http.ResponseWriter, r *http.Request, db *mgo.Database) error {
	p := r.URL.Query().Get("page")
	page, err := strconv.Atoi(p)
	if page < 1 || err != nil {
		page = 1
	}

	size := 10
	s := r.URL.Query().Get("count")
	if s != "" {
		size, _ = strconv.Atoi(s)
	}

	var runs []*test.TestSuites
	query := db.C("runs").Find(bson.M{}).Sort("-timestamp")
	total, err := query.Count()
	if err != nil {
		total = 0
	}

	meta := PageMeta{page, size, total}

	query.Limit(size).Skip((page - 1) * size)
	query.Select(bson.M{"testsuites.testcases": 0, "testsuites.device": 0})
	query.All(&runs)

	result := &RunsPage{runs, meta}

	return json.NewEncoder(w).Encode(result)
}
