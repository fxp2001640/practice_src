%{
/*
 * place directive "%point" at definition section to define yytext as character poing
 * place directive "%array" at definition section to define yytext as character array
*/
/*
 * assume text is "abcdefg", rule are : rule1, rule2, ..., ruleN, match result of every rule is : "not match" or "in matching" or "matched"
 * treate "a" as input, match result of every rule is : "not match" or "in matching" or "matched"
 * if summary result is "not match", then drop text "a" and treate "b" as input
 * if summary result is "in matching" or "matched", record the "match length"
 * increase input, treate "ab" as input
*/
%}

%top{
/*always put in top of destination file*/
#include "xmlParser.h"
#include "y.tab.h"
/*yylval means the value of token, it is a union*/
extern int isInTag;
}

DIGIT [0-9]
HEX_DIGIT [0-9a-fA-F]
MAC_SEG {HEX_DIGIT}{1,2}
IPV4_SEG {DIGIT}{1,3}
NAME [[:alpha:]|'_'][[:alnum:]|'_'|'-']*
NODEVALUE [[:alnum:]|'.']+

%s tag_start
 
%%

%{
 /* declare local variable */
int local_var;
if(isInTag)
{
    BEGIN(tag_start);
}
%}

 /*when used with bison, action should be : set yylval, return token type*/
{DIGIT}+ {yylval.sval = strdup(yytext); return NUM;}
{NAME} {yylval.sval = strdup(yytext); return WORD;}
{NODEVALUE} {yylval.sval = strdup(yytext); return WORD;}

 /*'return', yyterminate(), this will return to the caller of yylex. parsing will start from last break position in next yylex call*/
 /*action can modify yytext, but can't remove or insert string  in yytext*/
 /*'|', action is same as next rule*/
 /*REJECT, directs the scanner to proceed on to the “second best” rule which matched the input. use this action when you want to do many things for one match*/
 /*yymore(), tells the scanner that the next time it matches a rule, the corresponding token should be appended onto the current value of yytext rather than replacing it*/
 /*yyless(n), returns all but the first n characters of the current token back to the input stream, where they will be rescanned when the scanner looks for the next match*/
 /*unput(c), puts the character c back onto the beginning of input stream*/
 /*input(), reads the next character from the input stream*/
 /*BEGIN, active which rules*/
[ \n\t] {}
. {return yytext[0];}

%%

#if 0
int main(int argc, char **argv)
{
/*yyin, yyout can be redefined to redirect to different file*/
    if(argc > 1)
    {
        yyin = fopen(argv[1], "r");
    }
    else
    {
        yyin = stdin;
    }

    yylex();
/*yyrestart(), takes one argument, a FILE * pointer, and initializes yyin for scanning from that file*/
    return 0;
}
#endif
