%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
S: X Y
 | ;
X: 'a'X'b'
 | ;
Y: 'b'Y'c'
 | ;
%%

int main()
{
        yyparse();
        printf("\nString is accepted!\n");
}
int yyerror()
{
        printf("\nInvalid string\n");
        exit(0);
}

