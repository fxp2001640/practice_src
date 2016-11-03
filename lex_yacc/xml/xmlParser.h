#ifndef _XMLPARSER_H_
#define _XMLPARSER_H_

typedef struct attrEntry
{
    struct attrEntry *next;

    char *name;
    char *value;
}xmlTagAttr;

typedef struct xmlTagEntry
{
    struct xmlTagEntry *Parent;
    struct xmlTagEntry *NextSibling;
    struct xmlTagEntry *FirstChild;

    char *Name;
    char *Value;
    xmlTagAttr *Attr;
}xmlTag;

void freeXmlTree(xmlTag *node);
void printXmlTree(xmlTag *node, int dep);
xmlTag *parseXml(char *xmlFile);

#endif //_XMLPARSER_H_
