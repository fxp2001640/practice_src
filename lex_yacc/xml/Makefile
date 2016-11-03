obj=xml_parse.o xml_token.o xmlParser.o

xmlParser: $(obj)
	gcc $(obj) -o $@ -ly -ll

xml_parse.o:xml_parse.c y.tab.h

xmlParser.o:xmlParser.c xmlParser.h

xml_parse.c y.tab.h:xmlParse.y
	bison -y -d xmlParse.y
	mv y.tab.c xml_parse.c

xml_token.c: xmlParse.l y.tab.h
	flex xmlParse.l
	mv lex.yy.c $@

clean:
	rm -f xmlParser *.o xml_parse.c y.tab.h xml_token.c

$(obj):%.o:%.c

