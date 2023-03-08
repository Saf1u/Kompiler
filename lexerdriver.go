package main

import (
	"compiler/syntaxanalyzer"
	"fmt"
)

func main() {

	s := syntaxanalyzer.NewSyntaxAnalyzer()
	astRoot := s.Parse()
	fmt.Println(astRoot)
	visitor:=syntaxanalyzer.NewTableVisitor()
	astRoot.Accept(visitor)


}

