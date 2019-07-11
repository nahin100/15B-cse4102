%{
    #include<stdio.h>
    void yyerror(char* s);
    int yylex();
%}

%token NUM ADD SUB EOL
%start cal

%%
cal:  cal exp EOL {printf(">%d\n>", $2);}
    | cal EOL {printf(">");};
    | /*epsilon*/
    ;

exp: exp ADD NUM {$$ = $1+$3;}
    | exp SUB NUM {$$ = $1-$3; }
    | NUM {$$=$1;}
    ;

%%

int main()
{
    printf(">");
    yyparse();
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}