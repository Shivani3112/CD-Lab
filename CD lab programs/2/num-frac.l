%{
#include<stdio.h>
int pn=0, nn=0, pf=0, nf=0, invalid=0;
%}

%%
-[0-9]+ {nn++;}
\+?[0-9]+ {pn++;}
\+?\-?[0-9]+\.\-[0-9]+|\+?\-?[0-9]+\/\-[0-9]+ {invalid++;}
\-[0-9]+\/[0-9]+|\-[0-9]+\.[0-9]+ {nf++;}
\+?[0-9]+\/[0-9]+|\+?[0-9]+\.[0-9]+ {pf++;}
"\n" {return 0;}
%%

int main()
{
	yylex();
	printf("pn: %d\tnn: %d\tpf: %d\tnf: %d\tinvalid: %d\n",pn,nn,pf,nf,invalid);
	return 0;
}
