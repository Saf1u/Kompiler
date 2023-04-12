package main

import (
	"compiler/syntaxanalyzer"
)

func main() {
	//log.SetOutput(io.Discard)
	s := syntaxanalyzer.NewSyntaxAnalyzer()
	astRoot := s.Parse()
	visitors := syntaxanalyzer.NewTableVisitor()

	for _, visitor := range visitors {
		astRoot.Accept(visitor)
	}

}
