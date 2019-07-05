%option noyywrap
%{

void print(char *s);

enum yytokentype
{
    INT=250,
    ID=251
};


%}

delim [ \t\n]
ws ({delim})+
letter [A-Za-z]
digit [0-9]
id (_|{letter})({letter}|{digit})*
number ({digit}+)

%%
{ws} {}
"int" {return INT;}
{id} {return ID;}
%%

void print(char *s)
{
    printf("%s %s\n", s, yytext);
}

int main()
{
    int token; 
    while(token = yylex())
    {
        printf("%d %s\n", token, yytext);
    }
    return 0;
}