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
	for i := 0; i <= 27; i++ {
		transitionTable[i] = map[string]StateInfo{}
	}
	transitionTable[0][`\s`] = StateInfo{0, false, "InvalidChar"}
	transitionTable[0][`[a-zA-Z]`] = StateInfo{1, true, "IDToken"}
	transitionTable[0][`0`] = StateInfo{2, true, "IntegerToken"}
	transitionTable[0][`[1-9]`] = StateInfo{3, true, "IntegerToken"}
	transitionTable[0][`\.`] = StateInfo{10, true, "DotToken"}
	transitionTable[0][`:`] = StateInfo{11, true, "column"}
	transitionTable[0][`=`] = StateInfo{13, true, "assignment"}
	transitionTable[0][`<`] = StateInfo{15, true, "lessThan"}
	transitionTable[0][`>`] = StateInfo{19, true, "greaterThan"}
	transitionTable[0][`/`] = StateInfo{21, true, "fslash"}
	transitionTable[1][`[a-zA-Z]|[0-9]|_`] = StateInfo{1, true, "IDToken"}
	transitionTable[2][`\.`] = StateInfo{4, false, "InvalidNum"}
	transitionTable[4][`[0-9]`] = StateInfo{5, false, "InvalidNum"}
	transitionTable[5][`[0-9]`] = StateInfo{27, false, "InvalidNum"}
	//I renamed***
	transitionTable[27][`[0-9]`] = StateInfo{27, false, "InvalidNum"}
	transitionTable[27][`e`] = StateInfo{6, false, "InvalidNum"}
	//I renamed***
	transitionTable[6][`[+|-]`] = StateInfo{7, false, "InvalidNum"}
	transitionTable[7][`[1-9]`] = StateInfo{8, true, "FloatToken"}
	transitionTable[8][`[0-9]`] = StateInfo{8, true, "FloatToken"}
	transitionTable[7][`0`] = StateInfo{9, true, "FloatToken"}
	transitionTable[11][`:`] = StateInfo{12, true, "ScopeResToken"}
	transitionTable[13][`=`] = StateInfo{14, true, "EqualityToken"}
	transitionTable[13][`>`] = StateInfo{18, true, "LambdaToken"}
	transitionTable[15][`>`] = StateInfo{17, true, "NotEqualToken"}
	transitionTable[15][`=`] = StateInfo{16, true, "LessThanEqualToken"}
	transitionTable[19][`=`] = StateInfo{20, true, "GreaterThanEqualToken"}
	transitionTable[21][`\*`] = StateInfo{24, false, "GreaterThanEqualToken"}
}

func main() {
	//regexp.MatchString
}
