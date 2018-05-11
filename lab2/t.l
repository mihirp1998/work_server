%{
#include<stdio.h>
%}
la ([0-2][0-9]|[3][0-1])\/((0(1|3|5|7|8))|(10|12))\/([1-2][0-9][0-9][0-9])
lb ([0-2][0-9]|30)\/((0(4|6|9))|11)\/([1-2][0-9][0-9][0-9])
lc ([0-1][0-9]|2[0-8])\/02\/([1-2][0-9][0-9][0-9])
ld 29\/02\/([1-2][0-9][0-9][0-9])
ver {la}|{lb}|{lc}|{ld}
%%
{ver} { //printf("WORKS");
	printf("It is a valid date\n");
	printf("%c%c/",yytext[3],yytext[4]);
	printf("%c%c/",yytext[0],yytext[1]);
	printf("%c%c%c%c",yytext[6],yytext[7],yytext[8],yytext[9]);
    }
. {
	printf("INCORRECT DATE");
}
%%
main()
{
yylex();
}
int yywrap(void)
{
return 1;
}