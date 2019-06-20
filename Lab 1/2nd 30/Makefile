
C = gcc

all: main

main: main.o new1.o new2.o
	$(C)  main.o new1.o new2.o -o main

main.o: main.c
	$(C) -c main.c

new1.o: new1.c
	$(C) -c new1.c

new2.o: new2.c
	$(C) -c new2.c

clean:
	rm main.o new1.o new2.o main

