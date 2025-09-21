%{
int yylex();
int yyerror();
#include<stdio.h>
%}

%token alpha numeric
%%
start : S '\n' {printf("Valid identifier\n"); return 0;}
S : alpha A
A : numeric A
  | alpha A 
  | 
  ;
%%
int main()
{
return yyparse();
}
int yyerror()
{
printf("Invalid identifier\n");
}
