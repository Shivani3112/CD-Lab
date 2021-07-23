%{
#include<stdio.h>
int ch=0, w=0, s=0, l=0;
%}

%%
"\n" {l++;}
" " {s++;}
[a-zA-Z][a-zA-Z]* {w++;ch=ch+yyleng;}
"-1" {return 0;}
%%

int main()
{
	yylex();
	printf("Letters: %d\nwords: %d\nspaces: %d\nlines: %d\n",ch,w,s,l);
	return 0;
}
