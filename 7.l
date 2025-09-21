%{
#define YYSTYPE double
#include "7.tab.h"
%}
%option noyywrap
%%
[0-9]+(\.[0-9]+)? {yylval=atof(yytext); return num;}
. {return yytext[0];}
\n {return '\n';}
%%
