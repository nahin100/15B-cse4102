%option noyywrap
%{
//declarations
int count_one=0;
int count_two=0;
//("1"|"3"|"5"|"7"|"9") {printf("ODD\n"); count_one++;}
//("2"|"4"|"6"|"8"|"0") {printf("EVEN\n"); count_two++;}

enum yytokentype
{
    INT=150,
    ID=251
};

void print(char *s);

%}

delim [ \t\n]
ws ({delim})+
letter [a-zA-Z]
digit [0-9]
num ({digit})+


%%
{ws} {}
"int" {return INT;}
"if" {print("IF");}
"(" {print("LP");}
")" {print("RP");}
"{" {print("LB");}
"}" {print("RB");}
"==" {print("EQUAL");}
"=" {print("ASSIGN");}
{num} {print("NUMBER");}
";" {print("SEMI");}
("_"|{letter})({letter}|{digit})* {return ID;}
. {printf("\nIGNORING\n");}
%%

void print(char *s)
{
    printf("%s %s\n", s, yytext);
}

int main()
{
    int token;

    while(token=yylex())
    {
        printf("%d %s\n", token, yytext);

    }

    printf("no of odd digit is = %d\n", count_one);
    printf("no of even digit is = %d\n", count_two);

    return 0;

}