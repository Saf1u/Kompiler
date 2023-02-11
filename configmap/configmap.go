package configmap

import (
	"flag"
	"fmt"
	"os"
)

var conf map[string]string

func init() {
	conf = make(map[string]string)
	var file string
	flag.StringVar(&file, "file", "", "file to tokenize")
	flag.Parse()
	if file == "" {
		fmt.Fprintf(os.Stderr, "File not specified")
		os.Exit(1)
	}
	set("file", file)
}

func set(key string, value string) {
	conf[key] = value
}

func Get(key string) string {
	return conf[key]
}
