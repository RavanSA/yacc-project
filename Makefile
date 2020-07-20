
plangyacc:start.y
	yacc -d plang.y

planglex:start.l
	lex plang.l

run:y.tab.c
	gcc y.tab.c -o example -ll -ly

texteditor:
	./example < example.plang

clean:
	rm start.l
	rm lex.yy.c
	rm start.y
	rm y.tab.c
