%{
	#include "symtab2.c"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	extern FILE *yyin;
	extern FILE *yyout;
	extern int lineno;
	extern int yylex();
	void yyerror();
%}

/* YYSTYPE union */
%union{
    char char_val;
	int int_val;
	double double_val;
	char* str_val;
	list_t* symtab_item;
}

%token<int_val> CHAR INT FLOAT DOUBLE IF ELSE WHILE FOR CONTINUE BREAK VOID RETURN
%token<int_val> ADDOP MULOP DIVOP INCR OROP ANDOP NOTOP EQUOP RELOP
%token<int_val> LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE SEMI DOT COMMA ASSIGN REFER
%token <symtab_item> ID
%token <int_val> 	 ICONST
%token <double_val>  FCONST
%token <char_val> 	 CCONST
%token <str_val>     STRING

%left LPAREN RPAREN LBRACK RBRACK
%right NOTOP INCR REFER
%left MULOP DIVOP
%left ADDOP
%left RELOP
%left EQUOP
%left OROP
%left ANDOP
%right ASSIGN
%left COMMA

%type <int_val> constant names type expression declaration

%start program

%%

program: declarations statements;

statements: statements statement | ;

statement: ID ASSIGN expression SEMI 
	| ID INCR SEMI 
	{  
		list_t* l = search($1->st_name);

		printf("%s\n", $1->st_name);

		if(l!=NULL)
		{
	          int type = l->st_type;
			  if(type==UNDEF)
			  {
				  printf("variable is declared before use!\n");
			  } 
			  else if(type==INT_TYPE)
			  {
				  printf("no problem\n");
			  }
			  else
			  {
				  printf("Type mismatch\n");
			  }
		}

	}
    | INCR ID SEMI;

declarations: declarations declaration | ;

declaration: {declare = 1;} type ID {declare = 0;} names SEMI 
			{
				printf("==============================\n");
	
				printf("type = %d\n", $2);
				printf("names = %d\n", $5);

				list_t *l = search($3->st_name);
				l->st_type = $2;

				if($2==INT_TYPE && $5 ==INT_TYPE)
				{
					printf("no problem\n");
				}
				else
				{
					fprintf(stderr, "Type conflict between %d and %d using op type \n", $2, $5);
					exit(1);
				}

			};

type: INT {$$=INT_TYPE;} | CHAR {$$=CHAR_TYPE;} | FLOAT {$$=REAL_TYPE;} | DOUBLE {$$=REAL_TYPE;} | VOID ;

names: ASSIGN expression 
{
	$$ = $2;
};

constant: ICONST {$$=INT_TYPE;} | FCONST {$$=REAL_TYPE;} | CCONST {$$=CHAR_TYPE;} ;

expression:
    expression ADDOP expression |
    expression MULOP expression |
    expression DIVOP expression |
    ID INCR |
    INCR ID |
    expression OROP expression |
    expression ANDOP expression |
    NOTOP expression |
    expression EQUOP expression |
    expression RELOP expression |
    LPAREN expression RPAREN |
    sign constant { $$=$2;} |
	ID 
;

sign: ADDOP | /* empty */ ;


%%

void yyerror ()
{
  fprintf(stderr, "Syntax error at line %d\n", lineno);
  exit(1);
}

int main (int argc, char *argv[])
{
	int flag;
	flag = yyparse();
	
	printf("Parsing finished!");
	
	// symbol table data
	// yyout = fopen("symtab_data.out", "w");
	// symtab_data(yyout);
	// fclose(yyout);
	
	return flag;
}
