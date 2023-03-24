#!/bin/bash
./compiler -file files/semantictests/testc.src 
cat files/semantictests/testc.src-code.m files/semantictests/testc.src-data.m >final.m
moon final.m lib.m