# Kompiler


## currently at lexer phasse
- ```download go for your os and arch```
- ```go build . in root of project```
- ```./compiler -file files/[file-name]```
- sample files+output+errors can be found in the file directory (AND THE DFA)

## currently at syntax analyzer phase 

- ```./compiler -file files/[file-name] -deriveOut [true|false]```
- bool flag controls if left derivation is generated (makes thing slow a bit)

## currently at final demo phase
### To run in project root with option to generate derivation:
- ```./run.sh filename [true|false]```
