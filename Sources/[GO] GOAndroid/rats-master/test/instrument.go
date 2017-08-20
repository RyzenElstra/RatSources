package test

import (
	"fmt"
	"github.com/wmbest2/android/adb"
	"github.com/wmbest2/android/apk"
	"github.com/wmbest2/rats-server/rats"
	"regexp"
	"strconv"
	"strings"
	"time"
)

const (
	NUM_TESTS = iota
	STREAM
	ID
	TEST
	CLASS
	CURRENT
	STACK
	CODE
	LONG_MSG
)

type instToken struct {
	Timestamp time.Time
	Type      int
	Value     []byte
}

type RunPair struct {
	Tests  *TestSuite
	Device *rats.Device
}

func tokenForLine(line [][]byte) *instToken {
	token := &instToken{Timestamp: time.Now()}
	if string(line[1]) == "CODE" {
		token.Type = CODE
		token.Value = line[2]
	} else {
		switch string(line[3]) {
		case "numTests":
			token.Type = NUM_TESTS
		case "stream":
			token.Type = STREAM
		case "longMsg":
			token.Type = LONG_MSG
		case "stack":
			token.Type = STACK
		case "id":
			token.Type = ID
		case "test":
			token.Type = TEST
		case "current":
			token.Type = CURRENT
		case "class":
			token.Type = CLASS
		}

		token.Value = line[4]
	}
	return token
}

func processLastToken(test *TestCase, token *instToken) bool {
	if token == nil {
		return false
	}
	switch token.Type {
	case TEST:
		test.Name = strings.TrimSpace(string(token.Value))
	case CLASS:
		test.Classname = strings.TrimSpace(string(token.Value))
	case LONG_MSG:
		fallthrough
	case STACK:
		test.Stack = string(token.Value) + "\n"
	default:
		return false
	}
	return true
}

func parseInstrumentation(suite *TestSuite, in chan []byte) {
	instrumentCheck := regexp.MustCompile("INSTRUMENTATION_(?:STATUS|RESULT)(?:(?:_(CODE): (.*))|(?:: ([^=\n]*)=(.*)))")
	var currentTest *TestCase
	var lastToken *instToken
	var startTime, endTime time.Time
	for v := range in {
		if instrumentCheck.Match(v) {

			if currentTest == nil {
				currentTest = &TestCase{}
			}

			vals := instrumentCheck.FindSubmatch(v)
			lastToken = tokenForLine(vals)

			if suite.Tests == 0 && lastToken.Type == NUM_TESTS {
				suite.Tests, _ = strconv.Atoi(string(lastToken.Value))
			}

			processLastToken(currentTest, lastToken)
			if lastToken.Type == CODE && string(lastToken.Value) == "1" {
				startTime = lastToken.Timestamp
			} else if lastToken.Type == CODE || lastToken.Type == LONG_MSG {
				endTime = lastToken.Timestamp
				v := string(lastToken.Value)
				switch {
				case lastToken.Type == LONG_MSG:
					currentTest.Stack = fmt.Sprintf("Test failed to run to completion. Reason: '%s'. Check device logcat for details", currentTest.Stack)
					fallthrough
				case v == "-2":
					currentTest.Failure = &currentTest.Stack
					suite.Failures++
				case v == "-1":
					currentTest.Error = &currentTest.Stack
					suite.Errors++
				}

				currentTest.Time = endTime.Sub(startTime).Seconds()
				suite.Time += currentTest.Time
				suite.TestCases = append(suite.TestCases, currentTest)
				currentTest = nil
				lastToken = nil

				if suite.Tests != 0 && suite.Tests == len(suite.TestCases) {
					// return early
					return
				}
			}
		} else {
			if lastToken != nil && (lastToken.Type == STACK || lastToken.Type == LONG_MSG) {
				currentTest.Stack += fmt.Sprintf("%s\n", v)
			}
		}
	}
}

func RunTests(manifest *apk.Manifest, devices []*rats.Device) (chan *rats.Device, chan *TestSuites) {
	finished := make(chan *rats.Device)
	out := make(chan *TestSuites)
	go func() {
		in := make(chan *RunPair)
		count := 0
		suites := &TestSuites{Success: true}

		for _, d := range devices {
			go RunTest(d, manifest, in)
			count++
		}

		for {
			select {
			case run := <-in:
				finished <- run.Device
				suites.TestSuites = append(suites.TestSuites, run.Tests)
				suites.Time += run.Tests.Time
				suites.Success = suites.Success && run.Tests.Failures == 0 && run.Tests.Errors == 0
				count--
			}

			if count == 0 {
				break
			}
		}
		out <- suites
	}()

	return finished, out
}

func LogTestSuite(device *rats.Device, manifest *apk.Manifest, out chan *RunPair) {
	testRunner := fmt.Sprintf("%s/%s", manifest.Package, manifest.Instrument.Name)
	in := adb.Shell(device, "am", "instrument", "-r", "-e", "log", "true", "-w", testRunner)
	suite := TestSuite{Device: device, Hostname: device.Serial, Name: device.String()}
	parseInstrumentation(&suite, in)
	out <- &RunPair{Tests: &suite, Device: device}
}

func RunTest(device *rats.Device, manifest *apk.Manifest, out chan *RunPair) {
	testRunner := fmt.Sprintf("%s/%s", manifest.Package, manifest.Instrument.Name)
	in := adb.Shell(device, "am", "instrument", "-r", "-w", testRunner)
	suite := TestSuite{Device: device, Hostname: device.Serial, Name: device.String()}
	parseInstrumentation(&suite, in)

	out <- &RunPair{Tests: &suite, Device: device}
}
