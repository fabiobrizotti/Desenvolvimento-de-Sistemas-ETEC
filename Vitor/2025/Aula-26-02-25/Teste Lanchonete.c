#include <stdio.h>

void mostrarMenu() {
    printf("Menu de Lanches:\n");
    printf("1. X-Burguer - R$ 15.00\n");
    printf("2. X-Salada - R$ 18.00\n");
    printf("3. X-Bacon - R$ 20.00\n");
    printf("4. X-Milho - R$ 16.00\n");
    printf("5. X-Frango - R$ 20.00\n");
    printf("6. Finalizar Compra\n");
}

int main() {
    int escolha;
    float total = 0.0;

    do {
        mostrarMenu();
        printf("Escolha uma opção: ");
        scanf("%d", &escolha);

        switch (escolha) {
            case 1:
                total += 15.00;
                printf("Você escolheu X-Burguer. Total: R$ %.2f\n", total);
                break;
            case 2:
                total += 18.00;
                printf("Você escolheu X-Salada. Total: R$ %.2f\n", total);
                break;
            case 3:
                total += 20.00;
                printf("Você escolheu X-Bacon. Total: R$ %.2f\n", total);
                break;
            case 4:
                total += 16.00;
                printf("Você escolheu X-Milho. Total: R$ %.2f\n", total);
                break;
            case 5:
                total += 20.00;
                printf("Você escolheu X-Frango. Total: R$ %.2f\n", total);
                break;
            case 6:
                printf("Saindo...\n");
                break;
            default:
                printf("Opção inválida. Tente novamente.\n");
        }
    } while (escolha != 6);

    printf("Total final: R$ %.2f\n", total);
    return 0;
}