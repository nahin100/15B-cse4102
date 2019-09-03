%option noyywrap
%{
    enum yytokentype
    {
        DIGIT=100,
        PLUS=101,
        MINUS=102
    };
%}

%%
[0-9] {return DIGIT;}
"+" {return PLUS;}
"-" {return MINUS;}
%%

int main()
{
    int token;

    while(token=yylex())
    {
        printf("%d %s\n", token, yytext);
    }

    return 0;
}