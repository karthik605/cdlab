%{
#include "y.tab.h"
%}

%%
[0-9]+                  { yylval = atoi(yytext); return NUMBER; }
[-+*/\n]                { return *yytext; }
[ \t]                   ;  // Ignore whitespace
.                       { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;  // Indicate end of input
}
