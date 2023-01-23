package main

import (
	"bytes"
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"regexp"
)

type StateInfo struct {
	State int
	Final bool
	Type  string
}

var transitionTable map[int]map[string]StateInfo
var nestedComments int

func init() {
	transitionTable = make(map[int]map[string]StateInfo)
	for i := 0; i <= 36; i++ {
		transitionTable[i] = map[string]StateInfo{}
	}
	transitionTable[0][`\s`] = StateInfo{0, false, "InvalidChar"}
	transitionTable[0][`[a-zA-Z]`] = StateInfo{1, true, "IDToken"}
	transitionTable[0][`0`] = StateInfo{2, true, "IntegerToken"}
	transitionTable[0][`[1-9]`] = StateInfo{3, true, "IntegerToken"}
	transitionTable[3][`[0-9]`] = StateInfo{3, true, "IntegerToken"}
	transitionTable[3][`\.`] = StateInfo{4, false, "InvalidNum"}
	transitionTable[0][`\.`] = StateInfo{10, true, "DotToken"}
	transitionTable[0][`:`] = StateInfo{11, true, "column"}
	transitionTable[0][`}`] = StateInfo{32, true, "closeCurlyBracket"}
	transitionTable[0][`{`] = StateInfo{33, true, "openCurlyBracket"}
	transitionTable[0][`\[`] = StateInfo{34, true, "closeSquareBracket"}
	transitionTable[0][`]`] = StateInfo{35, true, "openSquareracket"}
	transitionTable[0][`\(`] = StateInfo{35, true, "closedParanthesis"}
	transitionTable[0][`\)`] = StateInfo{36, true, "openParenthesis"}
	transitionTable[0][`=`] = StateInfo{13, true, "assignment"}
	transitionTable[0][`<`] = StateInfo{15, true, "lessThan"}
	transitionTable[0][`>`] = StateInfo{19, true, "greaterThan"}
	transitionTable[0][`/`] = StateInfo{21, true, "fslash"}
	transitionTable[1][`[a-zA-Z]|[0-9]|_`] = StateInfo{1, true, "IDToken"}
	transitionTable[2][`\.`] = StateInfo{4, false, "InvalidNum"}
	transitionTable[4][`[0-9]`] = StateInfo{5, true, "floatToken"}
	transitionTable[5][`[1-9]`] = StateInfo{5, true, "floatToken"}
	transitionTable[5][`0`] = StateInfo{31, false, "InvalidfloatToken"}
	transitionTable[31][`[1-9]`] = StateInfo{5, true, "floatToken"}
	// i added normaltokens
	transitionTable[0][`\+`] = StateInfo{28, true, "plus"}
	transitionTable[0][`-`] = StateInfo{29, true, "minus"}
	transitionTable[0][`\*`] = StateInfo{30, true, "multiply"}
	//I renamed***
	//transitionTable[27][`[0-9]`] = StateInfo{27, false, "InvalidNum"}
	transitionTable[5][`e`] = StateInfo{6, false, "InvalidNum"}
	//I renamed***
	transitionTable[6][`[+|-]`] = StateInfo{7, false, "InvalidNum"}
	transitionTable[6][`[1-9]`] = StateInfo{8, true, "floatToken"}
	transitionTable[6][`0`] = StateInfo{9, true, "floatToken"}
	transitionTable[7][`[1-9]`] = StateInfo{8, true, "floatToken"}
	transitionTable[8][`[0-9]`] = StateInfo{8, true, "floatToken"}
	transitionTable[7][`0`] = StateInfo{9, true, "FloatToken"}
	transitionTable[11][`:`] = StateInfo{12, true, "ScopeResToken"}
	transitionTable[13][`=`] = StateInfo{14, true, "EqualityToken"}
	transitionTable[13][`>`] = StateInfo{18, true, "LambdaToken"}
	transitionTable[15][`>`] = StateInfo{17, true, "NotEqualToken"}
	transitionTable[15][`=`] = StateInfo{16, true, "LessThanEqualToken"}
	transitionTable[19][`=`] = StateInfo{20, true, "GreaterThanEqualToken"}
	transitionTable[21][`\*`] = StateInfo{24, false, "invalidComment"}
	transitionTable[24][`[^\*]`] = StateInfo{24, false, "invalidComment"}
	transitionTable[24][`\*`] = StateInfo{25, false, "invalidComment"}
	transitionTable[25][`[^/]`] = StateInfo{24, false, "invalidComment"}
	transitionTable[25][`/`] = StateInfo{26, true, "Comment"}
	transitionTable[21][`/`] = StateInfo{22, false, "invalidComment"}
	transitionTable[22][`[^\n]`] = StateInfo{22, false, "invalidComment"}
	transitionTable[22][`\n`] = StateInfo{23, true, "Comment"}
}

func main() {
	current := StateInfo{}
	fl, err := os.Open("lexpositivegrading.src")
	if err != nil {
		panic(err)
	}
	token := []rune{}
	data, err := ioutil.ReadAll(fl)
	if err != nil {
		panic(err)
	}
	fileByteSize := len(data)
	lastSuccesfulState := StateInfo{}
	lastSuccesfulCharIndex := -1
	lc := -1
	lineNum := 1
	reader := bytes.NewReader(data)
	realOffset := 0
	for r, _, err := reader.ReadRune(); err == nil; r, _, err = reader.ReadRune() {
		if fileByteSize-reader.Len() > realOffset {
			realOffset++
		}
		state := transitionTable[current.State]
		moved := false
		for k, v := range state {
			match, err := regexp.MatchString(k, string(r))
			if err != nil {
				panic(err)
			}
			if match {
				if v.State != 0 {
					token = append(token, r)
				}
				if r == '*' && v.State == 24 {
					nestedComments++
				}
				if r == '*' && v.State == 25&&token[len(token)-2]=='/' {
					nestedComments++
				}

				if v.Final {
					lastSuccesfulState = v
					lastSuccesfulCharIndex = (fileByteSize - reader.Len())
					lc = len(token)
				}
				moved = true
				current = v
				break
			}
		}
		if !moved {
			size := len(token)
			if size == 0 {
				fmt.Print("[Token Type:", "invalidCharacter", "Token:", string(r), " lineNum:", lineNum, "] ")
			} else {
				lexeme := string(token)
				if lc != -1 {
					lexeme = string(token[0:lc])
					fmt.Print("[Token Type:", lastSuccesfulState.Type, "Token:", lexeme, " lineNum:", lineNum, "] ")
				} else {
					fmt.Print("[Token Type:", current.Type, "Token:", lexeme, " lineNum:", lineNum, "] ")
					//always useless as >0 always leads to a success state from state 0
				}
			}

			if size >= 1 {
				reader.Seek(int64(lastSuccesfulCharIndex), io.SeekStart)
			}

			current = StateInfo{}
			token = []rune{}
			lastSuccesfulCharIndex = -1
			lc = -1
		}
		if r == '\n' && fileByteSize-reader.Len() >= realOffset {
			fmt.Println()
			lineNum++
		}
	}

}
