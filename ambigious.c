#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#define MAX_PRODUCTIONS 50
#define MAX_SYMBOLS 26

char productions[MAX_PRODUCTIONS][100];

bool isAmbiguous(int numProductions) {
    int productionCount[MAX_SYMBOLS] = {0}; 
    for (int i = 0; i < numProductions; i++) {
        char nonTerminal = productions[i][0];
        productionCount[nonTerminal - 'A']++;
    }
    for (int i = 0; i < MAX_SYMBOLS; i++) {
        if (productionCount[i] > 1) {
            return true; 
        }
    }
    return false;
}
int main() {
    int numProductions;
    printf("Enter the number of productions: ");
    scanf("%d", &numProductions);

    printf("Enter the productions:\n");
    for (int i = 0; i < numProductions; i++) {
        scanf("%s", productions[i]);
    }
    if (isAmbiguous(numProductions)) {
        printf("The grammar is ambiguous.\n");
    } else {
        printf("The grammar is not ambiguous.\n");
    }
    return 0;
}
