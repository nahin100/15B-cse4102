%option noyywrap

%{
    int count=0;

%}


alpha [A-Z]

%%
[A-Z][a-z] {printf("okjflks\n");}
. {printf("no\n");}
\n {return 0;}
%%

int main()
{
    yylex();
    printf("No of capital letters = %d\n", count);

    return 0;
}