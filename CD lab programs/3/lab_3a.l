%{
    #include<stdio.h>
    int single=0,multi=0;
%}

%%
\/\/(.*) { fprintf(yyout, ""); single++; }
"/*"([^*]|\*+[^*/])*\*+"/" { fprintf(yyout, ""); multi++; }
%%

int wrap(){}

int main(int k,char **argcv)
{
yyin=fopen(argcv[1],"r");
yyout=fopen("output.c","w");
yylex();
printf("Number of single line comment(s): %d\n",single);
printf("Number of multi line comment(s): %d\n",multi);
printf("Check the output file...\n");
return 0;
}

int yywrap(){}
