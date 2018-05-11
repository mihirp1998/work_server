%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
%}
%%
"<"|">"|"/"|[=] {return (yytext[0]);}
employee"_"details {yylval.s2 = strdup(yytext); return EMP;}
emp {yylval.s1 = strdup(yytext); return S;}
id {yylval.i1 = strdup(yytext); return I;}
name {yylval.n1 = strdup(yytext); return N;}
dob {yylval.d1 = strdup(yytext); return D;}
cgpa {yylval.c1 = strdup(yytext); return C;}
[<][?]xml[ ]version[=]["][1][.][0]["][?][>] {yylval.head = strdup(yytext); return HEADER;}
[1-3][0-9][0-9][0-9][A][A-Z0-9][TP][S][0-9][0-9][0-9][U] {yylval.a1 = strdup(yytext); return (ID);}
[A-Za-z]+ {yylval.a2 = strdup(yytext); return (NAME);}
[0-9]"."[0-9][0-9]|[1][0] {yylval.a3 = strdup(yytext); return (CGPA);}
[0-2][0-9]"/"[0-1][0-9]"/"[1-9][0-9][0-9][0-9] {yylval.a4 = strdup(yytext); return (DOB);}
. ;
%%
