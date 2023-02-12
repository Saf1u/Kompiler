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
	flag.StringVar(&file, "file", "", "file to tokenize")
	flag.Parse()
	if file == "" {
		fmt.Fprintf(os.Stderr, "File not specified")
		os.Exit(1)
	}
	set("file", file)
	set("printDerivation", true)
}

func set(key string, value interface{}) {
	conf[key] = value
}

func Get(key string) interface{} {
	return conf[key]
}
