package configmap

import (
	"flag"
	"fmt"
	"os"
)

var conf map[string]interface{}

func init() {
	conf = make(map[string]interface{})
	var file string
	var deriveOut bool
	flag.StringVar(&file, "file", "files/bubbleSort.src", "file to tokenize")
	flag.BoolVar(&deriveOut, "deriveOut", false, "build left derivation tree")
	flag.Parse()
	if file == "" {
		fmt.Fprintf(os.Stderr, "File not specified")
		os.Exit(1)
	}
	set("file", file)
	set("printDerivation", deriveOut)
}

func set(key string, value interface{}) {
	conf[key] = value
}

func Get(key string) interface{} {
	return conf[key]
}
