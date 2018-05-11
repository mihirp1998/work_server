
%{
#include <stdio.h>
#include <string.h>
%}
%union
{
char* a1;
char* a2;
char* a3;
char* a4;
char* s1;
char* s2;
char* n1;
char* d1;
char* c1;
char* i1;
char* head;
}

%token <a1>ID
%token <a2>NAME
%token <a3>CGPA
%token <a4>DOB
%token <s2>EMP
%token <s1>S
%token <n1>N
%token <c1>C
%token <d1>D
%token <i1>I
%token <head>HEADER
%%

Start:HEADER Emp_Details;
Emp_Details:"<" EMP ">" Per_Emp_Details "<" "/" EMP ">";
Per_Emp_Details:
Per_Emp_Details
"<" S I "=" ID ">"
"<" N ">" NAME "<" "/" N ">"
"<" D ">" DOB "<" "/" D ">"
"<" C ">" CGPA "<" "/" C ">"
"<" "/" S ">" {printf ("%s %s %s %s", $6, $11, $19, $27);};
|;
;

%%
main() 
{
yyparse();
}

yyerror()
{
printf("ERROR");
exit(1);
}
