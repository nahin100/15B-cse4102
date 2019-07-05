input = input.txt
output = output.txt
output2 = output2.txt

main: cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c
	./a.out

main2: prog.l
	flex prog.l
	gcc lex.yy.c
	./a.out <$(input)> $(output)

main3: prog2.l
	flex prog2.l
	gcc lex.yy.c
	./a.out <$(input)> $(output2)

