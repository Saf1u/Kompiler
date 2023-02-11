package lexer

import (
	"bytes"
	"compiler/configmap"
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

const (
	INTEGER               = "intlit"
	FLOAT                 = "floatlit"
	ID                    = "id"
	EQUAL                 = "eq"
	NOT_EQUAL             = "neq"
	LESS_THAN             = "lt"
	GREATER_THAN          = "gt"
	LESS_THAN_OR_EQAUL    = "leq"
	GREATER_THAN_OR_EQAUL = "geq"
	PLUS                  = "plus"
	MINUS                 = "minus"
	MULTIPLICATION        = "mult"
	DIVISION              = "div"
	ASSIGN                = "equal"
	OPEN_PARANTHESIS      = "lpar"
	CLOSE_PARANTHESIS     = "rpar"
	OPEN_CURL             = "lcurbr"
	CLOSE_CURL            = "rcurbr"
	OPEN_SQUARE           = "lsqbr"
	CLOSE_SQUARE          = "rsqbr"
	SEMI_COLON            = "semi"
	COMMA                 = "comma"
	DOT                   = "dot"
	COLON                 = "colon"
	RETURN_OP             = "arrow"
	SCOPE_RES             = "sr"
	INLINE_COMMENT        = "inlinecmt"
	BLOCK_COMMENT         = "blockcmt"
)

var transitionTable map[int]map[string]StateInfo
var identifierLookUp = map[string]bool{
	"integer": true, "float": true, "void": true, "class": true, "self": true, "isa": true, "while": true, "if": true, "then": true, "else": true, "read": true, "not": true,
	"write": true, "return": true, "localvar": true, "constructor": true, "attribute": true, "function": true, "public": true, "private": true, "or": true, "and": true,
}
var lex *lexer

func init() {
	file := configmap.Get("file")
	transitionTable = make(map[int]map[string]StateInfo)
	for i := 0; i <= 39; i++ {
		transitionTable[i] = map[string]StateInfo{}
	}
	outfile := fmt.Sprint(file, ".outlextokens")
	errfile := fmt.Sprint(file, ".outlexerrors")
	//"files/outsrc", "files/errsrc"
	transitionTable[0][`\s`] = StateInfo{0, false, "InvalidChar"}
	transitionTable[0][`[a-zA-Z]`] = StateInfo{1, true, ID}
	transitionTable[0][`0`] = StateInfo{2, true, INTEGER}
	transitionTable[0][`[1-9]`] = StateInfo{3, true, INTEGER}
	transitionTable[3][`[0-9]`] = StateInfo{3, true, INTEGER}
	transitionTable[3][`\.`] = StateInfo{4, false, "InvalidNum"}
	transitionTable[0][`\.`] = StateInfo{10, true, DOT}
	transitionTable[0][`:`] = StateInfo{11, true, COLON}
	transitionTable[0][`}`] = StateInfo{32, true, CLOSE_CURL}
	transitionTable[0][`{`] = StateInfo{33, true, OPEN_CURL}
	transitionTable[0][`\[`] = StateInfo{34, true, OPEN_SQUARE}
	transitionTable[0][`]`] = StateInfo{35, true, CLOSE_SQUARE}
	transitionTable[0][`\(`] = StateInfo{39, true, OPEN_PARANTHESIS}
	transitionTable[0][`\)`] = StateInfo{36, true, CLOSE_PARANTHESIS}
	transitionTable[0][`;`] = StateInfo{37, true, SEMI_COLON}
	transitionTable[0][`,`] = StateInfo{38, true, COMMA}
	transitionTable[0][`=`] = StateInfo{13, true, ASSIGN}
	transitionTable[0][`<`] = StateInfo{15, true, LESS_THAN}
	transitionTable[0][`>`] = StateInfo{19, true, GREATER_THAN}
	transitionTable[0][`/`] = StateInfo{21, true, DIVISION}
	transitionTable[1][`[a-zA-Z]|[0-9]|_`] = StateInfo{1, true, ID}
	transitionTable[2][`\.`] = StateInfo{4, false, "InvalidNum"}
	transitionTable[4][`[0-9]`] = StateInfo{5, true, FLOAT}
	transitionTable[5][`[1-9]`] = StateInfo{5, true, FLOAT}
	transitionTable[5][`0`] = StateInfo{31, false, "InvalidfloatToken"}
	transitionTable[31][`[1-9]`] = StateInfo{5, true, FLOAT}
	transitionTable[31][`0`] = StateInfo{31, false, "InvalidfloatToken"}
	transitionTable[0][`\+`] = StateInfo{28, true, PLUS}
	transitionTable[0][`-`] = StateInfo{29, true, MINUS}
	transitionTable[0][`\*`] = StateInfo{30, true, MULTIPLICATION}
	transitionTable[5][`e`] = StateInfo{6, false, "InvalidNum"}
	transitionTable[6][`[+|-]`] = StateInfo{7, false, "InvalidNum"}
	transitionTable[6][`[1-9]`] = StateInfo{8, true, FLOAT}
	transitionTable[6][`0`] = StateInfo{9, true, FLOAT}
	transitionTable[7][`[1-9]`] = StateInfo{8, true, FLOAT}
	transitionTable[8][`[0-9]`] = StateInfo{8, true, FLOAT}
	transitionTable[7][`0`] = StateInfo{9, true, FLOAT}
	transitionTable[11][`:`] = StateInfo{12, true, SCOPE_RES}
	transitionTable[13][`=`] = StateInfo{14, true, EQUAL}
	transitionTable[13][`>`] = StateInfo{18, true, RETURN_OP}
	transitionTable[15][`>`] = StateInfo{17, true, NOT_EQUAL}
	transitionTable[15][`=`] = StateInfo{16, true, LESS_THAN_OR_EQAUL}
	transitionTable[19][`=`] = StateInfo{20, true, GREATER_THAN_OR_EQAUL}
	transitionTable[21][`\*`] = StateInfo{24, false, "invalidComment"}
	transitionTable[24][`[^\*]`] = StateInfo{24, false, "invalidComment"}
	transitionTable[24][`\*`] = StateInfo{25, false, "invalidComment"}
	transitionTable[25][`[^/]`] = StateInfo{24, false, "invalidComment"}
	transitionTable[25][`/`] = StateInfo{26, true, BLOCK_COMMENT}
	transitionTable[21][`/`] = StateInfo{22, true, INLINE_COMMENT}
	transitionTable[22][`[^\n]`] = StateInfo{22, true, INLINE_COMMENT}
	lex = newLexer(file, outfile, errfile)

}

type lexer struct {
	token                     []rune
	reader                    *bytes.Reader
	lastSuccesfulState        StateInfo
	currentState              StateInfo
	nestedComments            int
	outTokenFile              *os.File
	lastSuccesfulFilePosition int
	charCount                 int
	outErrorFile              *os.File
	lineNum                   int
	realOffset                int
	fileSize                  int
	moved                     bool
}

type Token struct {
	TokenType  string
	TokenValue string
	LineNumber int
}

func newLexer(sourceFile string, tokenFile string, errorFile string) *lexer {
	defaultLexer := &lexer{}
	defaultLexer.currentState = StateInfo{}
	fl, err := os.Open(sourceFile)
	if err != nil {
		panic(err)
	}
	outFile, err := os.OpenFile(tokenFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	errFile, err := os.OpenFile(errorFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	token := []rune{}
	data, err := ioutil.ReadAll(fl)
	if err != nil {
		panic(err)
	}
	data = append(data, '\n')
	defaultLexer.outErrorFile = errFile
	defaultLexer.outTokenFile = outFile
	defaultLexer.token = token
	defaultLexer.fileSize = len(data)
	defaultLexer.lastSuccesfulState = StateInfo{}
	defaultLexer.lastSuccesfulFilePosition = -2
	defaultLexer.charCount = -1
	defaultLexer.lineNum = 1
	defaultLexer.reader = bytes.NewReader(data)
	defaultLexer.realOffset = 0
	return defaultLexer
}

func (lex *lexer) nextToken() *Token {
	for r, _, err := lex.reader.ReadRune(); err == nil; r, _, err = lex.reader.ReadRune() {
		if lex.fileSize-lex.reader.Len() > lex.realOffset {
			lex.realOffset = lex.fileSize - lex.reader.Len()
		}
		state := transitionTable[lex.currentState.State]
		lex.moved = false
		for k, v := range state {
			match, err := regexp.MatchString(k, string(r))
			if err != nil {
				panic(err)
			}
			if match {
				if v.State != 0 {
					if r == '\n' {
						//add new line as literal newline
						lex.token = append(lex.token, '\\')
						lex.token = append(lex.token, 'n')
					} else {
						lex.token = append(lex.token, r)
					}
				}
				//nested comment logic
				if r == '*' && v.State == 24 {
					lex.nestedComments++
				}
				if r == '*' && v.State == 25 && lex.token[len(lex.token)-2] == '/' {
					lex.nestedComments++
					v.State = 24
				}
				if v.State == 26 {
					lex.nestedComments--
					if lex.nestedComments > 0 {
						v.State = 24
					}
				}
				//done logic

				if v.Final {
					//track last succesful character and position for future backtracking
					lex.lastSuccesfulState = v
					lex.lastSuccesfulFilePosition = (lex.fileSize - lex.reader.Len())
					lex.charCount = len(lex.token)
				}
				lex.moved = true
				lex.currentState = v
				break
			}
		}
		token := &Token{}
		if !lex.moved {
			size := len(lex.token)
			//invalid character read
			if size == 0 {
				fmt.Fprintf(lex.outTokenFile, "[%s, %s, %d]", "invalidchar", string(r), lex.lineNum)
				fmt.Fprintf(lex.outErrorFile, "Lexical error: Invalid Character: \"%s\": line%d.\n", string(r), lex.lineNum)
				token.TokenType = "invalidchar"
				token.TokenValue = string(r)
				token.LineNumber = lex.lineNum
			} else {
				//winding succesful token by cutting off at last succesful read position
				if lex.charCount != -1 {
					lexeme := string(lex.token[0:lex.charCount])
					tokenType := lex.lastSuccesfulState.Type
					_, exist := identifierLookUp[lexeme]
					if tokenType == ID && exist {
						tokenType = lexeme
					}
					fmt.Fprintf(lex.outTokenFile, "[%s, %s, %d]", tokenType, lexeme, lex.lineNum)
					token.TokenType = tokenType
					token.TokenValue = lexeme
					token.LineNumber = lex.lineNum
				}
			}

			//if backtracking, seek back to succesful position to progress read of non-succesful tokens
			if size >= 1 {
				lex.reader.Seek(int64(lex.lastSuccesfulFilePosition), io.SeekStart)
			}

			//refresh token and file history to prepare for next token read
			lex.currentState = StateInfo{}
			lex.token = []rune{}
			lex.lastSuccesfulFilePosition = -1
			lex.charCount = -1

		}
		if r == '\n' && lex.fileSize-lex.reader.Len() >= lex.realOffset {
			if lex.currentState.State != 24 {
				fmt.Fprintln(lex.outTokenFile)
			}
			lex.lineNum++
		}
		if !lex.moved {
			return token
		}

	}
	//handling non-terminated block comment
	if lex.currentState.State == 24 {
		token := &Token{}
		token.LineNumber = lex.lineNum - 1
		token.TokenType = "unterminatedCmntBlock"
		token.TokenValue = string(lex.token)
		fmt.Fprintf(lex.outTokenFile, "[%s, %s, %d]", token.TokenType, token.TokenValue, token.LineNumber)
		fmt.Fprintf(lex.outErrorFile, "Lexical error: Invalid Comment: \"%s\": line%d.\n", string(lex.token), token.LineNumber)
		lex.currentState.State = 0
		return token
	}
	return nil

}

func NextToken() *Token {
	return lex.nextToken()
}
