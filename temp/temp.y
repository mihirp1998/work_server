%{
#include<stdio.h>
int z=0,out=0;
%}
%token ZERO ONE
%%
S : A {printf("s is a");}
A: A ZERO{printf("multizero");}
	| ZERO {printf("first zero");}
	| ONE {printf("1st one");}
	| A ONE {printf("multiple ones");};	
%%
main(){

yyparse();
}

void yyerror(char *msg)
{
     printf("error in input %s\n", msg);
     exit(1);
}
