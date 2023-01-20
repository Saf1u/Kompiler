package main

import (
	"fmt"
	"regexp"
)

type StateInfo struct {
	State int
	Final bool
	Type  string
}

var transitionTable map[int]map[string]StateInfo

func init() {
	transitionTable = make(map[int]map[string]StateInfo)
	for i := 0; i <= 26; i++ {
		transitionTable[i] = map[string]StateInfo{}
	}
	transitionTable[0][`\s`] = StateInfo{0, false, ""}
	transitionTable[0][`[a-zA-Z]`] = StateInfo{0, false, ""}

}

func main() {
	//regexp.MatchString
}
