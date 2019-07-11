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

%%

program: statements;

statements: statements statement 
			| /*epsilon*/
			;

if_statement: IF LPAREN expression RPAREN tail optional_else
			;

tail: LBRACE statements RBRACE

statement: if_statement 
		 | ID ASSIGN expression SEMI 
		 | type ID SEMI 
		 | type ID ASSIGN expression SEMI 
		 ;

type: INT 
	| CHAR 
	| FLOAT 
	| DOUBLE 
	| VOID ;



optional_else: ELSE tail 
			  | /* epsilon */
			  ;

constant: ICONST 
		| CCONST 
		| FCONST 
		;

expression: expression ADDOP expression
		  | expression OROP expression
		  | expression ANDOP expression
		  | expression EQUOP expression
		  | constant 
		  | ID
		  ;

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
