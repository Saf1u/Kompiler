#!/bin/bash
go build  .
./compiler -file files/semantictests/$1
 cat  files/semantictests/$1-data.m  files/semantictests/$1-code.m>moonBin/$1.m
 moon moonBin/$1.m moonBin/lib.m