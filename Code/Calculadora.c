#include <stdio.h> // Inclui a biblioteca padrão de entrada e saída (para printf e scanf)

int main() {
    char operador; // Variável para armazenar o operador (+, -, *, /)
    double num1, num2; // Variáveis para armazenar os dois números (double para permitir decimais)

    // Solicita ao usuário para inserir o operador
    printf("Digite um operador (+, -, *, /): ");
    scanf(" %c", &operador); // O espaço antes de %c é importante para consumir qualquer caractere de nova linha anterior

    // Solicita ao usuário para inserir dois números
    printf("Digite dois operandos: ");
    scanf("%lf %lf", &num1, &num2); // %lf é o especificador de formato para double

    // Usa uma estrutura switch para realizar a operação baseada no operador
    switch (operador) {
        case '+':
            printf("%.2lf + %.2lf = %.2lf\n", num1, num2, num1 + num2);
            break; // Sai do switch após a execução do case

        case '-':
            printf("%.2lf - %.2lf = %.2lf\n", num1, num2, num1 - num2);
            break;

        case '*':
            printf("%.2lf * %.2lf = %.2lf\n", num1, num2, num1 * num2);
            break;

        case '/':
            // Verifica se o divisor é zero para evitar erro de divisão por zero
            if (num2 != 0) {
                printf("%.2lf / %.2lf = %.2lf\n", num1, num2, num1 / num2);
            } else {
                printf("Erro: Divisão por zero não é permitida.\n");
            }
            break;

        // Caso o operador inserido não seja nenhum dos válidos
        default:
            printf("Erro: Operador inválido!\n");
    }

    return 0; // Indica que o programa foi executado com sucesso
}