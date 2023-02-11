package syntaxanalyzer

import (
	"compiler/lexer"
	"fmt"
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
}

func (s *Syntaxanalyzer) Top() string {
	return s.stack.Top()
}
func (s *Syntaxanalyzer) Pop() string {
	return s.stack.Top()
}
func (s *Syntaxanalyzer) Push(str string) {
	s.stack.Push(str)
}

func NewSyntaxAnalyzer() *Syntaxanalyzer {
	return &Syntaxanalyzer{stack: newStack()}
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
