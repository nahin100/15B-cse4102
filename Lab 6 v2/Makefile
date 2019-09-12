
main:
	bison -d parser.y  
	flex lexer.l  
	gcc -o a.out parser.tab.c lex.yy.c  
	rm lex.yy.c parser.tab.c
	# For linux user: add this line to makefile -> ./a.out <full_example.c> output.txt
	# For windows user: 
	# 1. run this makefile using "make" command
	# 2. then run this command "a.out <full_example.c> output.txt 
	# If problem still exists, follow this tutorial to switch
	# from powershell.exe to cmd.exe by using this tutorial
	# Link: https://stackoverflow.com/questions/42729130/visual-studio-code-how-to-switch-from-powershell-exe-to-cmd-exe/43751743
	
main2:
	gcc main.c
	./a.out
