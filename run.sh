#!/bin/bash
go build  .
./compiler -file files/semantictests/wemove.src 
cat  files/semantictests/wemove.src-data.m  files/semantictests/wemove.src-code.m>moonBin/wemovefinal.m
moon moonBin/wemovefinal.m moonBin/lib.m