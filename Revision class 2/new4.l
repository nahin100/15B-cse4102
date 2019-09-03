%option noyywrap
%{

%}

%%
[ \n\t] {} 
"Sub" {printf("%s == SUB\n", yytext);}
"Dim" {printf("%s == DIM\n", yytext);}
"As" {printf("%s == AS\n", yytext);}
"Boolean" {printf("%s == BOOL\n", yytext);}
("_"|[A-Z]|[a-z])([A-Z]|[a-z]|[0-9])* {printf("okokkkk\n");}
%%

int main()
{
    yylex();    

    return 0;

}