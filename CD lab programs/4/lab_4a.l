%{
    #include<stdio.h>
    int opcount =0;
    int idcount =0;
    int numcount =0;
    int keywcount=0;
%}

int "int"
float "float"
for "for"
if "if"
else "else"
break "break"
continue "continue"
while "while"
char "char"
return "return"

%%
({int}|{float}|{for}|{if}|{else}|{break}|{while}|{char}|{break}|{continue}|{return}) {keywcount++;printf("\nKeyword: %s ",yytext);}
(\+|\-|\/|\*) {opcount++;printf("\nOperator: %s ",yytext);}
[a-zA-Z][a-zA-Z0-9]* {idcount++;printf("\nIdentifier: %s ",yytext);}
[0-9]+ {numcount++;printf("\nNumber: %s ",yytext);}
. ;
%%

int yywrap(){}

int main(int k,char **argcv) {
	yyin=fopen(argcv[1],"r");
	yylex();
	printf("\n\nNumber of operators: %d\n", opcount);
	printf("Number of identifiers: %d\n", idcount);
	printf("Number of keywords: %d\n", keywcount);
	printf("Number of integers: %d\n", numcount);
}
