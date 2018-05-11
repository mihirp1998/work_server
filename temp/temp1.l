%{
#include<stdio.h>
#include "y.tab.h"
int line =0;
%}

%%
"0" {return ZERO;}
"1" {return ONE;}
%%
main(){
yylex();
}

int yywrap(){
return 1;
}
