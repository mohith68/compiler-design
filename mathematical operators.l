%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
double result = 0.0;
char last_operator = 0;
%}
%%
[0-9]+(\.[0-9]+)? {
    double operand = atof(yytext);
    switch(last_operator) {
        case '+': result += operand; break;
        case '-': result -= operand; break;
        case '*': result *= operand; break;
        case '/': result /= operand; break;
        case '^': result = pow(result, operand); break;
        default: result = operand; break;
    }
    last_operator = 0; // Reset the operator
}
[+]  { last_operator = '+'; }
[-]  { last_operator = '-'; }
[*]  { last_operator = '*'; }
[/]  { last_operator = '/'; }
[\^] { last_operator = '^'; }
"="  { printf("Result: %f\n", result); result = 0.0; last_operator = 0; }
"quit" { exit(0); }
[ \t\n] ; // Ignore whitespace and newlines
. { printf("Invalid input\n"); }
%%
int main() {
    while (1) yylex(); // Loop to keep processing input
    return 0;
}
