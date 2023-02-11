package main

import "compiler/syntaxanalyzer"

func main() {

	// for token := lexer.NextToken(); token != nil; token = lexer.NextToken() {
	// 	fmt.Println(*token)
	// }
	s := syntaxanalyzer.NewSyntaxAnalyzer()
	s.Parse()

}
