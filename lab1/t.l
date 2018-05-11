%{
#include<stdio.h>
int lineno = 0;
%}
constant (int|char|float)
operator ("<"|">"|"++"|"--"|"+"|"-"|"*")
keywords (if|while|do|for|switch)
digit [0-9]
letter [a-zA-Z]
identi {letter}({letter}|{digit})*
integer {digit}*
%%
{constant} {printf("\n");ECHO;printf(" constant %d",lineno);	}
{operator} {printf("\n");ECHO;printf(" operator %d",lineno);	}
{keywords} {printf("\n");ECHO;printf(" keyword %d",lineno);	}
{digit}* {printf("\n");ECHO;printf(" Integer %d",lineno);	}
{identi} {printf("\n");ECHO;printf(" identifier %d",lineno);	}
" " ;
"\t" ;
. "";
\n {lineno++;	}
%%
main()
{
yylex();
}
int yywrap()
{
return 1;
}