%{
#include<stdio.h>
%}
%option noyywrap
preprocessor #.*
identifier [_a-zA-Z][_a-zA-Z0-9]*
keyword auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|const|float|short|unsigned|continue|for|signed|void|default|goto|sizeof|volatile|do|if|static|while
comment "/*"(.|"\n")*"*/"
assmnt_op "="|"+="|"-="|"*="|"/="
relop "=="|"!="|"<"|"<="|">"|">="
logical_op "&&"|"!"|"||"
bitwise_op [&|^-]|"<<"|">>"
arith_op [\-+*/%]
integer ([0-9]+)
string \".*\"
punct [,;\[\]]
%%
{string}         {printf("\n String:\t%s",yytext);}
{keyword}        {printf("\n Keyword:\t%s",yytext);}
{preprocessor}   {printf("\n Preprocessor directive:\t%s",yytext);}
{comment}        {printf("\n Comment:\t%s",yytext);}
{identifier}\(   {printf("\n Function:\t%s",yytext);}
\{	         {printf("\n Begin block:\t%s",yytext);}
\}	         {printf("\n End block:\t%s",yytext);}
{assmnt_op}      {printf("\n Assignment operator:\t%s",yytext);}
{relop}          {printf("\n Relational operator:\t%s",yytext);}
{arith_op}       {printf("\n Arithmetic operator:\t%s",yytext);}
{logical_op}     {printf("\n Logical operator:\t%s",yytext);}
{bitwise_op}     {printf("\n Bitwise operator:\t%s",yytext);}
{identifier}:    {printf("\n Label:\t%s",yytext);}
{identifier}     {printf("\n Variable:\t%s",yytext);}
{integer}        {printf("\n Integer:\t%s",yytext);}
\)               {printf("\n End of function:\t%s",yytext);}
{punct}          {printf("\n Punctuation:\t%s",yytext);}
%%
int main(int argc,char **argv)
{
yyin=fopen(argv[1],"r");
yylex();
printf("\n");
fclose(yyin);
return 0;
}
