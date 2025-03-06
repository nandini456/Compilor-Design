/*Write a Lex Code to replace all the white spaces, tabs, new lines with single space by taking input from a file and storing output in another file*/
%{
#include <stdio.h>
%}
%%
[ \t\n]+  {fprintf(yyout," ");}
.         {fprintf(yyout, "%s", yytext);}
%%
int main()
{
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