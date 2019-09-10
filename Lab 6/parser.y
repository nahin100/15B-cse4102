%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "symtab.c"
	#include "codeGen.h"
	#include "semantic.h"
	extern FILE *yyin;
	extern FILE *yyout;
	extern int lineno;
	extern int yylex();
	void yyerror();
%}

/* YYSTYPE union */
%union{
	int int_val;
	list_t* id;
}

%token<int_val> INT IF ELSE WHILE CONTINUE BREAK PRINT
%token<int_val> ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token<int_val> LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token <id> ID
%token <int_val> ICONST

%left ADDOP SUBOP
%left MULOP DIVOP
%left LT GT
%left EQUOP
%right ASSIGN

%start program

%%
program: {gen_code(START, -1);} code {gen_code(HALT, -1);} ;

code: declarations statements;

declarations: |
			  declarations declaration 
			  ;

declaration:  INT ID SEMI
			  {
				  insert($2->st_name, strlen($2->st_name), INT_TYPE);
			  }
			  | INT ID ASSIGN ICONST SEMI
			  {
				  insert($2->st_name, strlen($2->st_name), INT_TYPE);
				  gen_code(LD_INT_VALUE, $4);
				  list_t* id = search($2->st_name);
				  gen_code(STORE, id->address);
			  }
			  ;

statements: statements statement |  ;

statement: assigment SEMI 
		  | PRINT ID SEMI
		  {
			  int address = id_check($2->st_name);
			  
			  if(address!=-1)
				  gen_code(WRITE_INT, address);
			  else
			  	exit(1);
		  };

assigment: ID ASSIGN exp 
		   {
			   int address = id_check($1->st_name);
			  
			  if(address!=-1)
				  gen_code(STORE, address);
			  else 
			  	exit(1);
		   }
		   ;

exp:  ID  
	  {
		  int address = id_check($1->st_name);
			  
			  if(address!=-1)
				  gen_code(LD_VAR, address);
			  else 
			  	exit(1);
	  }
	| ICONST { gen_code(LD_INT, $1); }			  
	| exp ADDOP exp { gen_code(ADD, -1); } 		  
	| exp SUBOP exp 		  
	| exp MULOP exp 		  
	| exp DIVOP exp 		  
	| exp EQUOP exp 		  
	| exp GT exp 		  	  
	| exp LT exp 		  	  
	| LPAREN exp RPAREN
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
	flag = yyparse();
	
	printf("Parsing finished!\n");	

	printf("\n\n================STACK MACHINE INSTRUCTIONS================\n");
	print_code();

	printf("\n\n================MIPS assembly================\n");
	print_assembly();

	return flag;
}
