%{
#include <stdio.h>
int v=0;
int c=0;
%}

%%
[\t\n]+;
[aeiouAEIOU] {v++;}
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]  { c++; }
%%

int main(){
printf("enter the input string:\n");
yylex();
printf("no of vowels:%d",v);
printf("no of consonants:%d\n",c);
}

int yywrap()
{
return 1;
}
