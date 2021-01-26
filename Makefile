a.out: main.o lex.yy.o Asintactico.tab.o
		gcc main.o lex.yy.o Asintactico.tab.o -ll

main.o: main.c Asintactico.tab.c
		gcc -c main.c

lex.yy.o: lex.yy.c
		gcc -c lex.yy.c

Asintactico.tab.o: Asintactico.tab.c
		gcc -c sintactico.tab.c 

lex.yy.c: Alexico.l Asintactico.tab.c
		flex Alexico.l

Asintactico.tab.c: Asintactico.y
		bison -d Asintactico.y

clean:
		rm -f a.out main.o lex.yy.o Asintactico.tab.o lex.yy.c Asintactico.tab.c Asintactico.tab.h

run: a.out
		./a.out
