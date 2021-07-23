%{
    #include<stdio.h>
    #include<stdlib.h>
    int flag=0;
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
Exp: E{ printf("\nResult = %d\n",$$); return 0; }
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'('E')' {$$=$2;}
 | NUMBER {$$=$1;}
;
%%

void main()
{
   printf("\nEnter any expression for calculation\n");
   yyparse();
  if(flag==0)
   printf("\nValid Expression\n\n");
   exit(0);
 
}
void yyerror()
{
   printf("\nInvalid Expression\n\n");
   flag=1;
   exit(0);
}
