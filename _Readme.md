***2025.11.16 Início dos Estudos em linguagem C***

# Introdução à Linguagem C

A linguagem C é uma linguagem de programação de propósito geral desenvolvida na década de 1970 por Dennis Ritchie nos Laboratórios Bell. Ela é amplamente utilizada para o desenvolvimento de sistemas operacionais, software embarcado, aplicações de alto desempenho e muito mais. A linguagem C é conhecida por sua eficiência, portabilidade e controle sobre recursos de hardware.

## Características Principais
- **Baixo Nível**: C permite manipulação direta de memória e acesso a hardware, tornando-a ideal para programação de sistemas.
- **Portabilidade**: Código escrito em C pode ser compilado em diferentes plataformas com poucas
modificações.
- **Linguagem Estruturada**: Suporta programação estruturada, facilitando a organização do código.
- **Biblioteca Padrão**: Oferece uma ampla gama de funções padrão para manipulação de strings, arquivos, matemática, etc.
- **Ponteiros**: Permite o uso de ponteiros para manipulação eficiente de memória e arrays.
## Aplicações Comuns
- Desenvolvimento de sistemas operacionais (ex: Unix, Linux)    
- Software embarcado (ex: firmware para dispositivos)
- Aplicações de alto desempenho (ex: jogos, simulações)
- Compiladores e interpretadores
- Ferramentas de desenvolvimento (ex: editores de texto, depuradores)
## Exemplos de Código
```c
#include <stdio.h>
int main() {
    printf("Hello, World!\n");
    return 0;
}
```

```c
#include <stdio.h>
void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}
int main() {
    int x = 5, y = 10;
    printf("Before swap: x = %d, y = %d\n", x, y);
    swap(&x, &y);
    printf("After swap: x = %d, y = %d\n", x, y);
    return 0;
}
```
## Recursos para Aprender C
- Livros: "The C Programming Language" por Brian W. Kernighan e Dennis M. Ritchie
- Tutoriais Online: sites como GeeksforGeeks, Tutorialspoint, e Learn-C.org
- Cursos: Plataformas como Coursera, Udemy, e edX oferecem cursos de C
- Comunidades: Fóruns como Stack Overflow, Reddit (r/C_Programming) e grupos de estudo
## Conclusão
A linguagem C continua sendo uma das linguagens de programação mais influentes e amplamente utilizadas no mundo da computação. Seu poder, flexibilidade e eficiência a tornam uma escolha popular para desenvolvedores que buscam controle total sobre o hardware e desempenho otimizado. Se você está interessado em aprender programação de baixo nível ou deseja entender os fundamentos da computação, a linguagem C é um excelente ponto de partida.
