package main

import (
	"compiler/syntaxanalyzer"
)

func main() {

	s := syntaxanalyzer.NewSyntaxAnalyzer()
	astRoot := s.Parse()
	visitor := syntaxanalyzer.NewTableVisitor()
	astRoot.Accept(visitor)

}
