/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
#include <stdio.h>

int main()
{
    float n1, n2, res_soma, res_sub, res_multi, res_div;
    int opcao;
     printf(" Digite o primeiro numero:");
     scanf("%f", &n1);
     printf("Digite o Segundo numero: ");
     scanf("%f", &n2);
     printf("escolha uma operacao: \n1) soma\n2) subtracao\n3) multiplicacao\n4) divisao\n");
     scanf("%i", &opcao);
     
     if(opcao == 1)
     {
         res_soma=n1+n2;
          printf("soma = %.2f \n", res_soma);
     }
     else if(opcao == 2)
     {
         res_sub=n1-n2;
          printf("subtracao = %.2f \n", res_sub);
     }
     else if(opcao == 3)
     {
         res_multi=n1*n2;
          printf("multiplicacao= %.2f \n", res_multi);
     }
     else if(opcao == 4)
     {
         if(n2 == 0)
         {
             printf("Impossivel dividir por 0");
         }
         else
         {
             res_div=n1/n2;
             printf("divisao = %.2f", res_div);
         }
     }
     else
     {
         printf("opcao invalida");
     }
     
    return 0;
}