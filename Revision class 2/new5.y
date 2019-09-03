%{
#include<stdio.h>
int yylex();
void yyerror(char *s);
%}

%token DOUBLE ID LB RB LP INT ASSIGN NUM SEMI IF EQUAL RP

%%
program: func_declare;
func_declare: type ID LB RB LP statements RP;
statements: statements statement | //epsilon;
statement: declaration | condition;
declaration: type ID ASSIGN NUM SEMI;
condition: IF LB ID EQUAL NUM RB LP statement RP;
type: DOUBLE | INT;
%%

int main()
{
    yyparse();
    printf("Parsing is successful\n");
    return 0;
}

void yyerror(char *s)
{

    
}