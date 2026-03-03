#include <stdio.h>
#include <ctype.h>

int main()
{
    int cont, cont_while = 1;
    char saida;
    
    //Contagem de 0 a 10
    for (cont = 0; cont <= 10 ; cont++) {
        printf("%i\n", cont);
    }
    
    //Contagem de 10 a 0
    for (cont = 10; cont >= 0 ; cont--) {
        printf("%i\n", cont);
    }
    
    //Contagem até 5 usando o while
    while(cont_while <= 5) {
        printf("\nAinda nao eh 5");
        cont_while++;
    }
    printf("\nSaiu do while com valor 5");
    
    //Saindo do programa apenas se o usuário digitar a letra correta, usando do while
    do {
        printf("\nPara sair do programa, digite a letra V\n");
        //Limpar a entrada de dados (fflush (stdin) - entrada padrão de dados)
        fflush(stdin);
        scanf("%c", &saida);
        //Deixar a letra digitada como maiúscula (toupper(var))
        saida = toupper(saida);
    }while(saida != 'V');

    return 0;
}