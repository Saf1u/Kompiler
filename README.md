# Kompiler
A compiler for a statically typed oop language.

## Langugae reference
The Wiki page contains the grammar of the language and valid/invalid  language tokens

## Building the compiler toolchain
The compiler itself is written in go. To build it you need to install go and run go build in the directory's root to get a binary.
To  run programs, you need to build the moon virtual machine as well.

### The moon virtual machine
The Moon Virtual Machine was written by a professor at my university and the source is provided as part of the [course](https://users.encs.concordia.ca/~paquet/wiki/index.php?title=COMP442/6421_-_winter_2023) the project was done for. 
For convenience, it is in the virtual machine directory in the repo.

### Running programs
Assuming you have successfully built Kompiler and Moon, to run a program you need to write it based on the specified grammar rules in the wiki. It is a C-like language.



 
