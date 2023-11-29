%{
#include <stdio.h>
%}

%token NUMBER

%%
calc: exp { printf("Result: %d\n", $1); getchar(); }
    ;

exp: exp '+' term { $$ = $1 + $3; }
   | exp '-' term { $$ = $1 - $3; }
   | term          { $$ = $1; }
   ;

term: term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    | factor          { $$ = $1; }
    ;

factor: NUMBER        { $$ = $1; }
      | '(' exp ')'   { $$ = $2; }
      ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 1;
}
