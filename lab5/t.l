%{
#include <stdio.h>
#include "y.tab.h"
%}
id 20(0|1)[0-9]A[1-9A]((P|T)S)[0-9]{3}U
name [a-zA-Z]+
date (0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)[0-9][0-9]
cgpa ([0-9]\.[0-9]{2})|(10\.00)
%%
{id} { return ID; }
{name} { return NAME; }
{date} { return DATE; }
{cgpa} { return CGPA; }
\n { return NL; }
%%