%{
#include <stdio.h>
int tabs=0,spaces=0,lines=0,chars=0;
%}
%%
\t          {tabs++; }
\n          {lines++;}
" "         {spaces++;}
.           {chars++;}
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
    fprintf(yyout,"Total tabs : %d\nTotal spaces : %d\nTotal lines : %d\nTotal chars : %d\n",tabs,spaces,lines,chars);
    fclose(f1);
    fclose(f2);
}
int yywrap()
{
    return 1;
}
