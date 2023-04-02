 #!/bin/bash
 go build  .
 ./compiler -file $1
 fname=$(basename  $1)
 cat  $1-data.m  $1-code.m>moonBin/$fname.m
 moon moonBin/$fname.m moonBin/lib.m