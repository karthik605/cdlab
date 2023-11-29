%option noyywrap
%{
	#include<stdio.h>
	int line_count=0;
	int word_count=0;
%}

%%
\n {line_count++;}
[a-zA-Z]+ {word_count++;}
.  ;
%%
int main()
{

	return 0;
}