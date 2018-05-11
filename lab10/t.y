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

%token <iVal> NUMBER
%token EOLN PLUS MINUS MUL DIV LRP RRP 
%token SEMICOLON ID

%type <sVal> expr
/*
  E -> E + E | E * E | NUM | ID | (E)
  printf ("T1:got %d * %d\n", $1, $3);

%left PLUS 
%left MUL
*/

%%

lines  : lines expr SEMICOLON   
         { 
           printf( "The infix expr is %s\n", $2);
           free($2);
           printf( "2:Pl enter yet another postfix expr ending with ; or <ctrl-d> to quit : ");
         }
       | lines SEMICOLON  
       |   /*epsilon*/    { printf("1:Pl enter a postfix expr ending with ; or <ctrl-d> to quit : ");}    
       ;

expr	 : expr expr PLUS
         { 
           char *res = malloc(strlen($1)+strlen($2) + 5);
           sprintf (res, " (%s + %s) ", $1, $2);
           free($1); free($2);
           $$ = res;
         }
       | expr expr  MUL       
         { 
           char *res = malloc(strlen($1)+strlen($2) + 5);
           sprintf (res, " (%s * %s) ", $1, $2);
           free($1); free($2);
           $$ = res;
         }
       | NUMBER                  { char *res = malloc(10); sprintf (res, "%d", $1); $$ = res;}
	     ;


%%
void yyerror(char *msg)
{
  printf("error in input %s\n", msg);
  exit(1);
}

int main()
{
  

  yyparse();
}
