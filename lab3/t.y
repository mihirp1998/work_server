%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define MAX_LEN  10
%}
%union {
  int iVal;
  char *sVal;
}

%token EOLN PLUS MINUS MUL DIV LRP RRP
%token <iVal> NUMBER 
%token SEMICOLON ID

%type <iVal> expr
/*
  E -> E  E + |  E E *  | NUM | ID 
  printf ("T1:got %d * %d\n", $1, $3);

%left PLUS 
%left MUL
*/

%%

lines  : lines expr SEMICOLON   
         { 
           printf( "The prefix expr result = %d\n", $2);
           printf( "2:Pl enter yet another prefix expr ending with ; or <ctrl-d> to quit : ");
         }
       | lines SEMICOLON  
       |   /*epsilon*/    { printf("1:Pl enter an prefix expr ending with ; or <ctrl-d> to quit : ");}    
       ;

expr	 : PLUS expr expr          { $$ = $2 + $3; }
	   | MINUS expr expr          { $$ = $2 - $3; }
       | MUL expr expr           { $$ = $2 * $3; } 
       | DIV expr expr           { $$ = $2 / $3; } 
       | NUMBER                  { $$ = $1;}
	     ;

%%
void yyerror(char *msg)
{
  printf("error in input %s\n", msg);
  exit(1);
}

int main()
{      yyparse();           }