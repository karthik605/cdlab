%{
	#include<stdio.h>
	int vcount=0,ccount=0,dcount=0;
%}
%%
[aeiouAEIOU] {vcount++;}
[a-zA-Z] {ccount++;}
[0-9] {dcount++;}
. yyterminate();
%%
main()
{
  
  yylex();
  printf("Number of Vowels is %d\n",vcount);
  printf("Number of Consonants is %d\n",ccount);
  printf("Number of Digits is %d\n",dcount);
  getchar();
  return 1;
  
}
int yywrap()
{
  return 1;
}
