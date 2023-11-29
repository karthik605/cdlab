%{
	#include <stdio.h>
	#include <string.h>
%}

%%

int|float|char|if|else|while		printf("Keyword: %s\n",yytext);
[a-zA-Z][a-zA-Z0-9_]*		printf("Identifier: %s\n",yytext);
. ;

%%
int main()
{
  yylex();
  return 0;
	
}
int yywrap()
{
   return 1;
}
