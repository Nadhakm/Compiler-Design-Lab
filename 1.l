%{
int lines=0, chars=0, words=0;
%}
%option noyywrap
%%
[a-zA-Z]+ {words++; chars+=yyleng;}
\n {lines++; chars++;}
. {chars++;}
%%
int main(int argc, char **argv)
{
yyin=fopen(argv[1],"r");
yylex();
printf(" No. of lines = %d\n No. of words = %d\n No. of characters = %d\n", lines, words, chars);
fclose(yyin);
}
