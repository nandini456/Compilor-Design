%{
#include <stdio.h>
int i=0;
%}
%%
[a-zA-Z_][a-zA-Z0-9_]*      {fprintf(yyout,"Valid Identifier : %s",yytext);}
[^\n]+                      {fprintf(yyout,"Invalid Identifier! : %s",yytext);}
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
