
main: parser.y lexer.l
	bison -d parser.y  
	flex lexer.l  
	gcc -o a.out parser.tab.c lex.yy.c  
	./a.out <input.c> output.txt

main2: cal.y cal.l
	bison -d cal.y  
	flex cal.l  
	gcc -o a.out cal.tab.c lex.yy.c  
	./a.out