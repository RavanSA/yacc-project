
plangyacc:start.y
	yacc -d Plang.y

planglex:start.l
	lex Plang.l

run:y.tab.c
	gcc y.tab.c -o ex -ll -ly

texteditor:
	./ex < example.plang

clean:
	rm Plang.l
	rm lex.yy.c
	rm Plang.y
	rm y.tab.c
