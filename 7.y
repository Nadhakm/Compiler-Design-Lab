%{
int yylex();
int yyerror();
#define YYSTYPE double
#include<stdio.h>
%}

%token num
%left '+' '-'
%left '*' '/'
%left '(' ')'
%right UMINUS
%%
start : E '\n' {printf("=%f\n",$1); return num;}
E : E '+' E {$$=$1+$3;}
  | E '-' E {$$=$1-$3;}
  | E '*' E {$$=$1*$3;}
  | E '/' E {$$=$1/$3;}
  | '-'E %prec UMINUS {$$=-$2;}
  | '('E')' {$$=$2;}
  | num {$$=$1;}
  ;
%%
int main()
{
return yyparse();
}
int yyerror()
{
printf("Invalid expression\n");
}
