package main

import (
	"compiler/lexer"
	"fmt"
)

func main() {

	for token := lexer.NextToken(); token != nil; token = lexer.NextToken() {
		fmt.Println(*token)
	}

}
