%{
    #include<stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token NUMBER
%token ADD SUB EOL

%%
cal:
 | cal exp EOL {printf("%d\n> ", $2);}
 | exp EOL {}
 ;

exp: NUMBER {$$=$1;}
 | exp ADD NUMBER {$$=$1+$3;}
 | exp SUB NUMBER {$$=$1-$3;}
 ;
%%

int main()
{
    //printf("> ");
    yyparse();
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}



