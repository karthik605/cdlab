%{
	#include<stdio.h>
	#include<string.h>
%}

%%
[01]*010[01]* {printf("String is accepted\n");}
[01]* {printf("String is rejected\n");}
.    {printf("Invalid string\n"); yyterminate();}
%%
int main()
{
	yylex();
	getchar();
	return 0;
}
int yywrap()
{
	return 1;
}
