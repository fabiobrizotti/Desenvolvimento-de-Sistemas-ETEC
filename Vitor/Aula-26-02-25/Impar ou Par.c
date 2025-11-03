/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>

int main()
{
    int numero, resto;
    
    printf(" Digite o primeiro numero:");
    scanf("%i", &numero);
    
    resto = numero % 2;
    
    if(resto ==0)
    {
        printf("Par");
    }
    else
    {
        printf("Impar");
    }
    return 0;
}
