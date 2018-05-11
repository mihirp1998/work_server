%{
#include <stdio.h>
#include "y.tab.h"
/*extern int yylval; */
%}

delim           [ \t\n]
ws              {delim}+
letter		[a-zA-Z]
l_		[letter_]
digit		[0-9]
id		{l_}({l_}|{digit})*
int_num		{digit}+

%%
{ws}	{}
"+"	{return PLUS;}
"-"	{return MINUS;}
"*"	{return MUL;}
"/"	{return DIV;}
"(" {return LRP;}
")" {return RRP;}
";" {return SEMICOLON;}
{int_num} {yylval.iVal = strtol(yytext, NULL, 10); return NUMBER;}
{id} 	{ return ID;}
.	{ printf ("yylex:error:%s:\n", yytext);}
%%