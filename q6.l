%{
#include <stdio.h>
%}
%%
[0-9]+"."[0-9]+ { fprintf(yyout, "Float Number : %s",yytext); }
[0-9]+          {fprintf(yyout, "Integer Number : %s",yytext);}
[^\n]+          {fprintf(yyout, "Invalid Number : %s",yytext);}          
%%
int main()
{
    FILE *f1 = fopen("input.txt", "r");
    FILE *f2 = fopen("output.txt", "w");
    if (!f1 || !f2)
    {
        printf("Error opening file\n");
        return 1;
    }
    yyin = f1;
    yyout = f2;
    fprintf(yyout, "Name : Nandini Maurya\nSection : B\nUniversity Roll No.: 2021320\n\n");
    yylex();
    fclose(f1);
    fclose(f2);
    return 0;
}

int yywrap()
{
    return 1;
}
