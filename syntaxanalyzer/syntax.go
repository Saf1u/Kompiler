package syntaxanalyzer

import (
	"compiler/configmap"
	"compiler/lexer"
	"fmt"
	"os"
	"strings"
)

type Stack struct {
	container []string
}

func newStack() *Stack {
	return &Stack{make([]string, 0)}
}

func (s *Stack) Push(str string) {
	s.tokenizeAndreversePush(str)
}
func (s *Stack) Pop() string {
	top := s.container[len(s.container)-1]
	s.container = s.container[:len(s.container)-1]
	return top
}
func (s *Stack) Top() string {
	top := s.container[len(s.container)-1]
	return top
}

func (s *Stack) tokenizeAndreversePush(str string) {
	rhs := strings.Split(str, " ")
	for i := len(rhs) - 1; i >= 0; i-- {
		s.container = append(s.container, rhs[i])
	}
}

type Syntaxanalyzer struct {
	stack          *Stack
	derivationBase string
	derivationFile *os.File
}

func (s *Syntaxanalyzer) Top() string {
	return s.stack.Top()
}
func (s *Syntaxanalyzer) Pop() string {
	char := s.stack.Pop()
	if !nonTerminal[char] && char != "&epsilon"  {
		s.derivationBase = fmt.Sprint(s.derivationBase, char)
	}
	return char
}
func (s *Syntaxanalyzer) Push(str string) {
	s.stack.Push(str)
	s.writeDerivation(str)
}
func (s *Syntaxanalyzer) writeDerivation(str string) {
	derivation := strings.Join(s.stack.container, " ")
	derivation = fmt.Sprint(derivation, s.derivationBase)
	for _, char := range derivation {
		s.derivationFile.WriteString(string(char))
	}
	s.derivationFile.WriteString("\n")
}

func NewSyntaxAnalyzer() *Syntaxanalyzer {
	file := configmap.Get("file")
	derivationFile := fmt.Sprint(file, ".derivation")
	fl, err := os.OpenFile(derivationFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	return &Syntaxanalyzer{stack: newStack(), derivationBase: "", derivationFile: fl}
}

func (s *Syntaxanalyzer) Parse() {
	s.stack.Push("$")
	s.stack.Push("START")
	token := lexer.NextToken()
	for token.TokenType == lexer.BLOCK_COMMENT || token.TokenType == lexer.INLINE_COMMENT {
		token = lexer.NextToken()
	}
	realtype := token.TokenType
	if token.TokenType == "self" {
		realtype = "id"
	}
	for s.Top() != "$" {
		x := s.Top()
		if !nonTerminal[x] {
			if realtype == x {
				s.Pop()
				token = lexer.NextToken()
				for token != nil && (token.TokenType == lexer.BLOCK_COMMENT || token.TokenType == lexer.INLINE_COMMENT) {
					token = lexer.NextToken()
				}
				if token == nil {
					s.Pop()
					break
				}
				realtype = token.TokenType
				if token.TokenType == "self" {
					realtype = "id"
				}
			} else {
				if x == "&epsilon" {
					s.Pop()
				} else {
					fmt.Println(token)
					fmt.Println(x)
					panic("nah")
				}
			}
		} else {

			if parseTable[x][realtype] != "" {
				s.Pop()

				s.Push(parseTable[x][realtype])
			} else {
				fmt.Println(token)
				fmt.Println(x)
				panic("nah t")
			}
		}
	}
	if s.Top() != "$" {
		panic("no dolla")
	} else {
		fmt.Println("succesful parse")
	}

}
