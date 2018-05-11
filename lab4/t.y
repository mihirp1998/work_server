%{
#include<stdio.h>
int count0 = 0,count1 = 0;
%}
%token ZERO ONE
%%
S   : A
    {
      printf("Count 0 = %d, Count 1 = %d\n", count0, count1);
    }
A   : A ZERO  {count0++; }
    | ZERO {count0++; }
    | ONE {count1++; }
    | A ONE {count1++; }
    ;
%%
void yyerror(char *msg)
{
     printf("error in input %s\n", msg);
     exit(1);
}
int main()
{
     int i;
     yyparse();
}