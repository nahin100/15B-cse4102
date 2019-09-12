
main:
	bison -d parser.y  
	flex lexer.l  
	gcc -o a.out parser.tab.c lex.yy.c  
	rm lex.yy.c parser.tab.c
	# For linux user: add this line to makefile -> ./a.out <full_example.c> output.txt
	# For windows user: 
	./a.out <full_example.c> output.txt
	# 1. run this makefile using "make" command
	# 2. then run this command "a.out <full_example.c> output.txt 
	
main2:
	gcc main.c
	./a.out