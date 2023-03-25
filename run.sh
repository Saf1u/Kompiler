#!/bin/bash
go build  .
./compiler -file files/semantictests/testc.src 
cat  files/semantictests/testc.src-data.m  files/semantictests/testc.src-code.m>moonBin/final.m
moon moonBin/final.m moonBin/lib.m