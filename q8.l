%{
#include <stdio.h>
%}
DIGIT    [0-9]
ID       [a-zA-Z_][a-zA-Z0-9_]*
FLOAT    {DIGIT}+\.{DIGIT}*
NUMBER   {DIGIT}+
OPERATOR [=+\-*/<>]
SEPARATOR [;(),{}]
%%
"int"|"float"|"while"|"if"|"else"   { fprintf(yyout,"KEYWORD: %s\n", yytext); }
{ID}                                { fprintf(yyout,"IDENTIFIER: %s\n", yytext); }
{NUMBER}                            { fprintf(yyout,"NUMBER: %s\n", yytext); }
{FLOAT}                             { fprintf(yyout,"FLOAT: %s\n", yytext); }
{OPERATOR}                          { fprintf(yyout,"OPERATOR: %s\n", yytext); }
{SEPARATOR}                         { fprintf(yyout,"SEPARATOR: %s\n", yytext); }
[ \t\n]                              { /* Ignore whitespace */ }
.                                   { fprintf(yyout,"UNKNOWN: %s\n", yytext); }
%%

int main() {
    FILE *f1=fopen("input.txt" , "r");
    FILE *f2=fopen("output.txt" , "w");
    if(!f1 || !f2)
    {
        printf("Error");
        return 1;
    }
    yyin=f1;
    yyout = f2;
    fprintf(yyout,"Name : Nandini Maurya\nSection : B\nUniversity Roll No.: 2021320\n\n");
    yylex();
    fclose(f1);
    fclose(f2);
}
int yywrap()
{
    return 1;
}
