digit [0-9]*
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]\.[0-9]
%{
#include<stdio.h>
#include<string.h>
int i=0,j=0,cnt=0,n=0,com=0,scom=0;
char st[10][10];
int exists(char st[10][10],char *id,int n);
%}

%%
\n {scom=0;n++;}
"//" {scom=1;printf("\n single line comment\n\n");}
"/*" {com=1;printf("\n comment start\n");}
"*/" {com=0;printf("\n comment end\n");}
int |
float |
char |
double |
void |
main { if(!com&&!scom) printf(" \n %s is keyword",yytext);}
"<=" {if (!com&&!scom) printf("\n %s is Relational operator Lessthan or Equal to",yytext);}
"<" {if(!com&&!scom) printf("\n %s is Relational operator Lessthan",yytext);}
">=" {if(!com) printf("\n %s is Relational operator Greaterthan or Equal to",yytext);}
">" {if(!com&&!scom) printf("\n %s is Relational operator Greaterthan",yytext);}
"==" {if(!com&&!scom) printf("\n %s is Relational operator Equal to",yytext);}
"!=" {if (!com&&!scom) printf("\n %s is Relational operator Not Equal to",yytext);}
{id} { if(!com&&!scom) printf("\n %s is identifier",yytext); }

{num} { if(!com&&!scom) printf("\n %s is float",yytext);}
{digit} {if (!com&&!scom) printf("\n %s is digit",yytext);}
@ yyterminate();
%%
int main(int argc,char* argv[])
{
    if(argc!=2){
	fprintf(stderr,"Usage: %s <input_file>\n",argv[0]);
	getchar();
	return 1;
    }

    FILE* input_file=fopen(argv[1],"r");
    if(!input_file){
	perror("Failed to open input file");
	return 1;
    }
    yyin = input_file;
    yylex();
    printf(" \n\n\n no of lines = %d\n\n",n);
    fclose(input_file);
    getchar();
    return 1;
}
yywrap()
{
return 1;
}