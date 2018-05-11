%{
#include <stdio.h>
#include <stdlib.h>
extern char *yytext;
%}

%union
{
  char *sVal;
  int iVal;
}
 %token < sVal > ID NAME DATE CGPA NL %% xxx:data NL xxx | data NL;
data:id name date cgpa;
id:ID
{
  printf ("<p>\n %s", yytext);
};
name:NAME
{
  printf (" %s", yytext);
};
date:DATE
{
  printf (" %s", yytext);
};
cgpa:CGPA
{
  printf ("%s\n  </p>\n", yytext);
};
%%yyerror (char *msg)
{
  printf ("Error: %s\n", msg);
}
int
main ()
{
  printf ("<DOCTYPE html>\n");
  printf ("<html>\n");
  printf ("<body>\n");
  yyparse ();
  printf ("</html>\n");
  return 0;
}