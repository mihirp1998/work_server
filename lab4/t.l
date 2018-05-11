%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"0"     { return ZERO; }
"1"     { return ONE; }
.       { printf ("yylex:error:%s\n", yytext);}
%%