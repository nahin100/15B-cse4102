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
"int" {print("INT");}
{id} {print("ID");}
"(" {print("LP");}
")" {print("RP");}
"{" {print("LB");}
"}" {print("RB");}
"=" {print("ASSIGN");}
{number} {print("NUMBER");}
";" {print("SCOLON");}
%%

void print(char *s)
{
    printf("%s %s\n", s, yytext);
}

int main()
{
    
    yylex();
    return 0;
}