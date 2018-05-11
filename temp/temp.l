%{
#include<stdio.h>
int a = 0;
%}
letter [a-zA-Z]
number [0-9]
term	{letter}{number}*
%%
{term} {printf("term");}
"mim" {printf("non");} 
. {printf("date");}
%%
main(){
yylex();
}
int yywrap(){
return 1;

}

