 #!/bin/bash
 #go build  .
 ./compiler -file $1 -deriveOut $2
 fname=$(basename  $1)
 cat  $1-data.m  $1-code.m>moonBin/$fname.m
 cat $1.outlexerrors $1.outsyntaxerrors $1.outsemanticerrors > $1.errors
 moon moonBin/$fname.m moonBin/lib.m