
%{
#include <stdio.h>
#include <string.h>
#include "xmlParser.h"
/*define global variable*/
xmlTag *root;
int isInTag;
%}

/*define type for yylval, you also use : #define YYSTYPE double */
%union{
    int ival;
    char *sval;
    xmlTagAttr *attrval;
    xmlTag *node;
}

 /*type*/
 /*token*/
%token <sval> NUM
%token <sval> WORD
/*接合规则和优先级*/
/*%left '+' '-'*/
/*%left '*' '/'*/

/*define type for none-token, <member of yylval>, %type <ival> attr_value*/
%type <sval> xml_tag_end attr_value
%type <attrval> attr_exp attr_exp_list
%type <node> xml_doc xml_tag xml_tag_start self_close_tag

%%
xml_doc : xml_tag { $$ = $1; root = $1; }
        | xml_doc xml_tag 
          {
              xmlTag *Node = $1;
              while(Node->NextSibling)
                  Node = Node->NextSibling;
              Node->NextSibling = $2; 
              $$ = $1;
          }
        ;

xml_tag : self_close_tag                    { $$ = $1; }
        | xml_tag_start WORD xml_tag_end    { $1->Value = $2; $$ = $1; }
        | xml_tag_start xml_doc xml_tag_end 
          {
              xmlTag *children = $2;
              $1->FirstChild = $2;
              for(; children; children = children->NextSibling)
                  children->Parent = $1;
              $$ = $1;
          }
        ;

self_close_tag : '<' WORD attr_exp_list '/' '>' 
               {
                   xmlTag *nd = (xmlTag *)malloc(sizeof(xmlTag));
                   if(nd)
                   {
                       memset(nd, 0, sizeof(xmlTag));
                       nd->Name = $2;
                       nd->Attr = $3;
                   }
                   $$ = nd;
               }
               ;

xml_tag_start  : '<' WORD attr_exp_list '>' 
               {
                   xmlTag *nd = (xmlTag *)malloc(sizeof(xmlTag));
                   if(nd)
                   {
                       memset(nd, 0, sizeof(xmlTag));
                       nd->Name = $2;
                       nd->Attr = $3;
                   }
                   $$ = nd;
               }
               ;

xml_tag_end : '<' '/' WORD '>' { $$ = $3; }
            ;

attr_exp_list : attr_exp { $$ = $1; }
              | attr_exp_list attr_exp 
                { 
                    xmlTagAttr *attr = $1;
                    while(attr->next)
                        attr = attr->next;
                    attr->next = $2;
                    $$ = $1;
                }
              ;

attr_exp : WORD '=' attr_value 
         { 
             xmlTagAttr *attr = (xmlTagAttr *)malloc(sizeof(xmlTagAttr));
             if(attr)
             {
                 memset(attr, 0, sizeof(attr));
	         attr->name = $1;
                 attr->value = $3;
             }
             $$ = attr;
         }
         ;

attr_value : '\"' NUM '\"' { $$ = $2; }
           | '\"' WORD '\"' { $$ = $2; }
            ;

 /*$$ : $1 $2 $n*/
%%

xmlTag *parseXmlDoc(char *xmlFile)
{
    extern FILE *yyin;
/*yyin, yyout can be redefined to redirect to different file*/
    yyin = fopen(xmlFile, "r");

    yyparse();
/*yyrestart(), takes one argument, a FILE * pointer, and initializes yyin for scanning from that file*/

    return root;
}

