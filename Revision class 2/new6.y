%{
    #include<stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token DIGIT PLUS MINUS EOL MUL

%%
s: s exp EOL {printf("=%d\n", $2);}
  | //epsilon
  ;

exp: exp PLUS factor {$$=$1+$3;}
    |exp MINUS factor {$$=$1-$3;}
    |factor {$$=$1;}
    ;

factor: factor MUL DIGIT {$$=$1*$3;}
    | DIGIT {$$=$1;}
    ;
%%

int main()
{
    yyparse();
    return 0;
}

void yyerror(char *s)
{

}