
main:
	flex new1.l
	gcc lex.yy.c
	./a.out <prog.c> output.txt

main2:
	flex new4.l
	gcc lex.yy.c
	./a.out <cal_input.txt> output2.txt

main3:
	flex new5.l
	gcc lex.yy.c
	./a.out <full_example.txt> output.txt

main4:
	bison -d new5.y  
	flex new5.l  
	gcc -o a.out new5.tab.c lex.yy.c  
	./a.out <full_example.txt> output.txt