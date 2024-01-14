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
Assuming you have successfully built Kompiler and Moon, to run a program you need to write it based on the specified grammar rules in the wiki. For a quick demo of compiler feature I suggest running this code which multiplies two matrices:

```
function main()=>void{
    // initalizes three matrices
    localvar matrixa:Matrix(10,9,4,
                            6,71,11,
                            2,4,5);
    localvar matrixb:Matrix(1,11,7,
                           12,42,21,
                           42,2,4);
    localvar matrixc:Matrix;

    // stores result of multiplying into third
    matrixc=matrixa.multiply(matrixb);
    // prints stored result
    matrixc.print();
    // write -1 for debugging to know where I am in code
    write(-1);
    matrixa.print();
    write(-1);
    matrixb.print();
    write(matrixb.matrix[3-1][1-1]);
    write(matrixb.flag);
    /*
    286  ,496   ,275
    1320 ,3070 ,1577
    260 ,200,  118
    */


}


// matrix class
class Matrix{
    //member defenition
attribute matrix:integer[3][3];
attribute flag:integer;
    //constructor and class function defenition
public constructor: (a: integer,b:integer,c:integer,d:integer,e:integer,f:integer,g:integer,h:integer,i:integer);
 public function multiply:(x:Matrix)=>Matrix;
 public function print:()=>void;
 private function TestSelf:(v:integer)=>void;
};

// initalizes a 3x3 matrix
 function Matrix::constructor(a: integer,b:integer,c:integer,d:integer,e:integer,f:integer,g:integer,h:integer,i:integer){
    localvar mat:Matrix;
     mat.matrix[0][0]=a;
     mat.matrix[0][1]=b;
     mat.matrix[0][2]=c;

     mat.matrix[1][0]=d;
     mat.matrix[1][1]=e;
     mat.matrix[1][2]=f;


     mat.matrix[2][0]=g;
     mat.matrix[2][1]=h;
     mat.matrix[2][2]=i;
     return(mat);

}

// 3x3 matrix multiply algorithim
 function Matrix::multiply(x:Matrix)=>Matrix{
    localvar i:integer;
    localvar j:integer;
    localvar n:integer;
    localvar matrixc:Matrix(0,0,0,0,0,0,0,0,0);
    i=0;
    j=0;
    n=0;
    while(i<>3){
        j=0;
        while(j<>3){
            n=0;
            while(n<>3){
                matrixc.matrix[i][j]=(self.matrix[i][n]*x.matrix[n][j])+matrixc.matrix[i][j];
                n=n+1;
            };
            j=j+1;
        };
        i=i+1;
    };
    return (matrixc);
}
// matrix preety printing
 function Matrix::print()=>void{
    // self is similar to 'this' I am testing if I can call an internal method.
    self.TestSelf(341);
    localvar i:integer;
    localvar j:integer;
    i=0;
    j=0;
    while(i<>3){
        j=0;
        while(j<>3){
            write(self.matrix[i][j]);
            j=j+1;
        };
        i=i+1;
    };
}

function Matrix::TestSelf(val:integer)=>void{
    // testing if I can set a class memeber without calling 'self'
    flag=val;
}
```

copy this into any file and save it with the .src extension. To run:
```
- ./[name-of-go-binary-you-built] [filename].src
- cat [filename].src-data.m [filename].src-code.m > [filename].m
- [path to moon VM binary you built] [filename].m  [ path to lib.m file ]
```

- The first command compiles to produce among other things, a moon source file and a data file containing directives for the VM
- The second command concatenates the two files and makes a single executable file
-  The third command feeds moon VM the executable and links lib.m a file with moon library functions the compiler depends upon. lib.m can be found under virtual-machine/moon/samples

Another fun program to run is factorial which demonstrates recursion. enter -1 in the terminal to quit or try feeding it large numbers till a stack overflow happens:

```
function main()=>void{
    localvar x:integer;
    localvar res:integer;
    read(x);
    while(x>-1){
        res=factorial(x);
        write(res);
        read(x);
    };
   

}

function factorial(n:integer)=>integer{
    if (n==0)then{
   return(1);
    }else{
   return(n*factorial(n-1));
    };
}
```

## Issues 
This readme merely exists as a very high-level description to demo the compiler works. A lot of proper documentation is not yet written explaining the code and the compilation process as the project was done in extreme crunch time.
Also missing is proper testing, as I relied on manually diffing my compiler output files with the expected files provided by the course instructor to ensure I had no regression. The code has room for some refactoring as well which needs to be
done. Also, the building process and running of programs is too complicated and needs to be simplified. I may revisit and do an overhaul in the future if I have time.




 
