%option noyywrap

%{
    int count=0;

    enum yytokentype
    {
        INT = 250,
        ID = 251
    };

%}

delim [ \t\n]
ws ({delim})+
lowerletter [a-z]
letters ({lowerletter}*)
%%
{lowerletter}{lowerletter}{lowerletter} {printf("%s",yytext);}
. {printf("ok");}

%%

int main()
{
    yylex();
    return 0;
}