%{
#include "w111.tab.h"
%}

%%

[ \t]            ;  // Skip whitespace

"+"              { return PLUS; }
"-"              { return MINUS; }
"*"              { return MULT; }
"/"              { return DIV; }
"%"              { return MOD; }
"("              { return LPAREN; }
")"              { return RPAREN; }

[0-9]+           { yylval = atoi(yytext); return NUM; }

.               { return yytext[0]; }  // Any other character is returned as is

%%

int yywrap() {
    return 1;  // Indicate end of input
}
