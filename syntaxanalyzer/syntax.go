package syntaxanalyzer

import (
	"compiler/configmap"
	"compiler/lexer"
	"fmt"
	"os"
	"strings"
)

type SpecialStack struct {
	container       []string
	secondContainer []string
	traceDerivation bool
}

func newStack(trace bool) *SpecialStack {
	return &SpecialStack{make([]string, 0), make([]string, 0), trace}
}

func (s *SpecialStack) Push(str string) {
	s.tokenizeAndreversePush(str)
}
func (s *SpecialStack) Pop(actualtoken string) string {
	top := s.container[len(s.container)-1]
	s.container = s.container[:len(s.container)-1]
	if s.traceDerivation {
		if actualtoken != "&epsilon" && actualtoken != "" {
			s.secondContainer = append(s.secondContainer, actualtoken)
		}
	}

	return top
}
func (s *SpecialStack) Top() string {
	top := s.container[len(s.container)-1]
	return top
}

func (s *SpecialStack) tokenizeAndreversePush(str string) {
	rhs := strings.Split(str, " ")
	for i := len(rhs) - 1; i >= 0; i-- {
		s.container = append(s.container, rhs[i])
	}

}

type Syntaxanalyzer struct {
	stack           *SpecialStack
	derivationFile  *os.File
	traceDerivation bool
}

func (s *Syntaxanalyzer) Top() string {
	return s.stack.Top()
}
func (s *Syntaxanalyzer) Pop(actualtoken string) string {
	char := s.stack.Pop(actualtoken)
	if s.traceDerivation {
		s.writeDerivation(actualtoken)
	}
	return char
}
func (s *Syntaxanalyzer) Push(str string) {
	s.stack.Push(str)
	if s.traceDerivation {
		s.writeDerivation(str)
	}
}
func (s *Syntaxanalyzer) writeDerivation(str string) {
	if str == "" {
		return
	}
	reverseStack := make([]string, 0)
	for i := len(s.stack.container) - 1; i > 0; i-- {
		reverseStack = append(reverseStack, s.stack.container[i])
	}
	derivation := strings.Join(reverseStack, " ")
	derivation = fmt.Sprint(strings.Join(s.stack.secondContainer, " "), " ", derivation)
	for i := 0; i < len(derivation); i++ {
		s.derivationFile.WriteString(string(derivation[i]))
	}
	s.derivationFile.WriteString("\n")
}

func NewSyntaxAnalyzer() *Syntaxanalyzer {
	file := configmap.Get("file").(string)
	derive := configmap.Get("printDerivation").(bool)
	derivationFile := fmt.Sprint(file, ".derivation")
	if derive {
		fl, err := os.OpenFile(derivationFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
		if err != nil {
			panic(err)
		}
		return &Syntaxanalyzer{stack: newStack(derive), derivationFile: fl, traceDerivation: derive}
	}
	return &Syntaxanalyzer{stack: newStack(derive), traceDerivation: derive}
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
				s.Pop(token.TokenValue)
				token = lexer.NextToken()
				for token != nil && (token.TokenType == lexer.BLOCK_COMMENT || token.TokenType == lexer.INLINE_COMMENT) {
					token = lexer.NextToken()
				}
				if token == nil {
					s.Pop("")
					break
				}
				realtype = token.TokenType
				if token.TokenType == "self" {
					realtype = "id"
				}
			} else {

				fmt.Println(token)
				fmt.Println(x)
				panic("nah")

			}
		} else {

			if parseTable[x][realtype] != "" {
				s.Pop("")
				if parseTable[x][realtype] != "&epsilon" {
					s.Push(parseTable[x][realtype])
				}

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
