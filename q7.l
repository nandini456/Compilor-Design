%{
#include <stdio.h>
int count=0;
%}
%%
"//".*          {count++;}
"/ "([^]|\* + [^*/])*\*+"/"     {count++;}
.|\n        {fprintf(yyout,"%s",yytext);}     
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
    fprintf(yyout,"No. of comments removed are : %d",count);
    fclose(f1);
    fclose(f2);
    return 0;
}
int yywrap()
{
    return 1;
}
