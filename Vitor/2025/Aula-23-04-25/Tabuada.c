/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>

int main()
{
    int num, res, cont;
    printf("Digite um Numero: ");
    scanf("%i", &num);
    for(cont=1; cont <=10; cont++) {
        res = num * cont;
        printf("%i\n", res);
    }

    return 0;
}
