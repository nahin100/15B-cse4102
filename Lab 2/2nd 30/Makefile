input = input.txt
output = output.txt

main: cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c
	./a.out

#dfdfd
main2: prog.l
	flex prog.l
	gcc lex.yy.c
	./a.out <$(input)> $(output)

