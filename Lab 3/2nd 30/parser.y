%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    
	extern int lineno;
	int yylex();
	void yyerror();
%}

/* YYSTYPE union */
%union{
    char char_val;
	int int_val;
	double double_val;
	char* str_val;
}

/* token definition */
%token CHAR INT FLOAT DOUBLE IF ELSE WHILE FOR CONTINUE BREAK VOID RETURN
%token ADDOP MULOP DIVOP INCR OROP ANDOP NOTOP EQUOP RELOP
%token LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE SEMI DOT COMMA ASSIGN REFER
%token ID
%token <int_val> 	 ICONST
%token <double_val>  FCONST
%token <char_val> 	 CCONST
%token <str_val>     STRING


%start program

%left ADDOP OROP MULOP SUBOP ANDOP DIVOP RELOP EQUOP

%right ASSIGN INCR

%%
program: statements;

statements: statements statement | //epsilon;

statement: id_declare | if_statement | id_assign | for_statement;

id_assign: ID ASSIGN exp SEMI;

id_declare: INT ID ASSIGN ICONST SEMI
			| DOUBLE ID ASSIGN FCONST SEMI
			| FLOAT ID ASSIGN FCONST SEMI
			| CHAR ID ASSIGN CCONST SEMI;

for_statement: FOR LPAREN id_declare exp SEMI exp RPAREN tail;

if_statement: IF LPAREN exp RPAREN tail optional_else_statement;

optional_else_statement: ELSE tail | //epsilon;

tail: LBRACE statements RBRACE;

exp: exp EQUOP exp
	| exp ANDOP exp
	| exp OROP exp
	| exp ADDOP exp
	| exp MULOP exp
	| exp DIVOP exp
	| exp RELOP exp
	| exp ASSIGN exp
	| INCR exp
	| exp INCR
	| ID
	| ICONST
	| FCONST
	| CCONST;

%%

void yyerror ()
{
  fprintf(stderr, "Syntax error at line %d\n", lineno);
  exit(1);
}

int main (int argc, char *argv[])
{
	int flag;
	yyparse();
	
	printf("Parsing finished!");
}
