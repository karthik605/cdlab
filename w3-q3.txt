
%{
	#include<stdio.h>
	#include<string.h>
	int lc=0,intc=0,fc=0,idc=0;
%}

%%
\n {lc++;}
[0-9]+ {intc++;}
[0-9]+.[0-9]+ {fc++;}
[a-zA-Z][a-zA-Z0-9_]* {idc++;}
@ yyterminate();
%%
int main()
{
	yylex();
	printf("Number of lines:%d\n",lc);
	printf("Number of integers:%d\n",intc);
	printf("Number of floating point numbers:%d\n",fc);
	printf("Number of identifiers:%d",idc);
	getchar();
	return 0;
}
int yywrap()
{
  return 1;
}