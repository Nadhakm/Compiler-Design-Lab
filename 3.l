%{
int vowels=0, consonants=0;
%}
%option noyywrap
%%
[a|e|i|o|u|A|E|I|O|U] {vowels++;}
[a-zA-Z] {consonants++;}
.
%%
int main()
{
printf("Enter the string(Press Ctrl+D to stop): ");
yylex();
printf("\n No. of vowels = %d\n No. of consonants = %d\n", vowels, consonants);
return 0;
}
