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
		if rhs[i] != "&epsilon" {
			//semantic rule can intro epsilons
			s.container = append(s.container, rhs[i])
		}
	}

}

type SyntaxanalyzerParser struct {
	stack           *SpecialStack
	semStack        *semanticStack
	derivationFile  *os.File
	errorFile       *os.File
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
	derivationFile := fmt.Sprint(file, ".outderivation")
	errorFile := fmt.Sprint(file, ".outsyntaxerrors")
	astOutFileName := fmt.Sprint(file, ".ast.dot")
	errFile, err := os.OpenFile(errorFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	astFile, err := os.OpenFile(astOutFileName, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	if derive {
		fl, err := os.OpenFile(derivationFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
		if err != nil {
			panic(err)
		}
		return &SyntaxanalyzerParser{stack: newStack(derive), semStack: MakeSemanticStack(astFile), derivationFile: fl, traceDerivation: derive, errorFile: errFile}
	}
	return &SyntaxanalyzerParser{stack: newStack(derive), semStack: MakeSemanticStack(astFile), traceDerivation: derive, errorFile: errFile}
}

func (s *SyntaxanalyzerParser) Parse() node {
	s.stack.Push("$")
	s.stack.Push("START")
	token := lexer.NextToken()
	for token.TokenType == lexer.BLOCK_COMMENT || token.TokenType == lexer.INLINE_COMMENT {
		token = lexer.NextToken()
	}
	realtype := replaceSelf(token.TokenType)
	for s.Top() != "$" {
		x := s.Top()
		if !nonTerminal[x] {
			if action, exist := semanticActions[x]; exist {
				action(s.semStack)
				s.Pop("")
				if token == nil {
					//pop reptstart
					if s.Top() == "REPTSTART0" {
						s.Pop("")
						break
					} else {
						s.semStack.dotFile.WriteString("}")
						return s.semStack.Pop()
					}

				}
			} else {
				s.semStack.mostRecentTokenValue = *token
				if realtype == x {
					s.Pop(token.TokenValue)
					token = lexer.NextToken()
					for token != nil && (token.TokenType == lexer.BLOCK_COMMENT || token.TokenType == lexer.INLINE_COMMENT) {
						token = lexer.NextToken()
					}
					if token == nil {
						//pop reptstart
						if s.Top() == "REPTSTART0" {
							s.Pop("")
							break
						} else {
							s.semStack.dotFile.WriteString("}")
							return s.semStack.Pop()
						}

					}
					realtype = replaceSelf(token.TokenType)

				} else {
					if token == nil {
						s.semStack.dotFile.WriteString("}")
						return s.semStack.Pop()

					}
					var empty bool
					realtype, empty = s.skipError(*token)
					if empty {
						s.semStack.dotFile.WriteString("}")
						return s.semStack.Pop()
					}
				}
			}
		} else {

			if parseTable[x][realtype] != "" {
				s.Pop("")
				if parseTable[x][realtype] != "&epsilon" {
					s.Push(parseTable[x][realtype])
				}
			} else {
				if token == nil {
					s.semStack.dotFile.WriteString("}")
					return s.semStack.Pop()

				}
				var empty bool
				realtype, empty = s.skipError(*token)
				if empty {
					s.semStack.dotFile.WriteString("}")
					return s.semStack.Pop()
				}
			}
		}
	}
	if s.Top() != "$" {
		fmt.Println(s.stack.container)
		panic("unexpected termination")
	}
	semanticActions["GROUPACTION"](s.semStack)
	s.semStack.dotFile.WriteString("}")
	return s.semStack.Pop()
}

func (s *SyntaxanalyzerParser) skipError(token lexer.Token) (string, bool) {
	s.writeError(token)
	if setsLookUpTable.InFollow(s.Top(), token.TokenType) {
		s.Pop("")
	} else {
		for !(setsLookUpTable.InFirst(s.Top(), token.TokenType)) &&
			!(setsLookUpTable.Nullable(s.Top()) && setsLookUpTable.InFollow(s.Top(), token.TokenType)) {
			temp := lexer.NextToken()
			if temp == nil {
				return "", true
			}
			token = *temp
		}
	}

	return replaceSelf(token.TokenType), false
}

func (s *SyntaxanalyzerParser) writeError(token lexer.Token) {
	if !nonTerminal[s.Top()] {
		s.errorFile.WriteString(fmt.Sprint("error at line number: ", token.LineNumber, " unexpected character: ", token.TokenValue, " expected:", s.Top(), "\n"))
	} else {
		sets := setsLookUpTable.GetSets(s.Top())
		s.errorFile.WriteString(fmt.Sprint("error at line number: ", token.LineNumber, " unexpected character: ", token.TokenValue, " expected either of:", sets, "\n"))
	}
}

func replaceSelf(tokenType string) string {
	if tokenType == "self" {
		return "id"
	}
	return tokenType
}
