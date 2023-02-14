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

type SyntaxanalyzerParser struct {
	stack           *SpecialStack
	derivationFile  *os.File
	traceDerivation bool
}

func (s *SyntaxanalyzerParser) Top() string {
	return s.stack.Top()
}
func (s *SyntaxanalyzerParser) Pop(actualtoken string) string {
	char := s.stack.Pop(actualtoken)
	if s.traceDerivation {
		s.writeDerivation(actualtoken)
	}
	return char
}
func (s *SyntaxanalyzerParser) Push(str string) {
	s.stack.Push(str)
	if s.traceDerivation {
		s.writeDerivation(str)
	}
}
func (s *SyntaxanalyzerParser) writeDerivation(str string) {
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

func NewSyntaxAnalyzer() *SyntaxanalyzerParser {
	file := configmap.Get("file").(string)
	derive := configmap.Get("printDerivation").(bool)
	derivationFile := fmt.Sprint(file, ".derivation")
	if derive {
		fl, err := os.OpenFile(derivationFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
		if err != nil {
			panic(err)
		}
		return &SyntaxanalyzerParser{stack: newStack(derive), derivationFile: fl, traceDerivation: derive}
	}
	return &SyntaxanalyzerParser{stack: newStack(derive), traceDerivation: derive}
}

func (s *SyntaxanalyzerParser) Parse() {
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
				realtype = s.skipError(*token)

			}
		} else {

			if parseTable[x][realtype] != "" {
				s.Pop("")
				if parseTable[x][realtype] != "&epsilon" {
					s.Push(parseTable[x][realtype])
				}
			} else {
				realtype = s.skipError(*token)
			}
		}
	}
	if s.Top() != "$" {
		panic("no dolla")
	} else {
		fmt.Println("succesful parse")
	}

}

func (s *SyntaxanalyzerParser) skipError(token lexer.Token) string {
	fmt.Println("error at:", token.LineNumber)
	if setsLookUpTable.InFollow(s.Top(), token.TokenType) {
		s.Pop("")
	} else {
		for !(setsLookUpTable.InFirst(s.Top(), token.TokenType)) &&
			!(setsLookUpTable.Nullable(s.Top()) && setsLookUpTable.InFollow(s.Top(), token.TokenType)) {
			temp := lexer.NextToken()
			if temp == nil {
				fmt.Println("here")
				os.Exit(1)
			}
			token = *temp
		}
	}
	if token.TokenType == "self" {
		return "id"
	}
	return token.TokenType
}
