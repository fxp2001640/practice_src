#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "xmlParser.h"

void freeXmlTree(xmlTag *node)
{
    xmlTagAttr *attr, *next;

    if(!node)
        return;

    if(node->FirstChild)
        freeXmlTree(node->FirstChild);
    node->FirstChild = NULL;

    if(node->NextSibling)
        freeXmlTree(node->NextSibling);
    node->NextSibling = NULL;

    for(attr = node->Attr; attr; attr = next)
    {
        next = attr->next;
        if(attr->name)
            free(attr->name);
        if(attr->value)
            free(attr->value);
        free(attr);
    }
    node->Attr = NULL;

    if(node->Name)
        free(node->Name);
    node->Name = NULL;

    if(node->Value)
        free(node->Value);
    node->Value = NULL;

    free(node);
    node = NULL;
}

void printXmlTree(xmlTag *node, int dep)
{
    int idx;
    xmlTagAttr *attr;

    if(!node)
    {
        return;
    }

    for(idx = 0; idx < dep; idx++)
    {
        printf("  ");
    }

    printf("%s (", node->Name);

    /*print attribute*/
    for(attr = node->Attr; attr; attr = attr->next)
    {
	printf("%s=%s ", attr->name, attr->value);
    }

    /*print value*/
    if(node->Value)
    {
	printf(") = %s\n", node->Value);
    }
    else
    {
	printf(")\n");
    }

    printXmlTree(node->FirstChild, dep+1);
    printXmlTree(node->NextSibling, dep);
}

extern xmlTag *parseXmlDoc(char *xmlFile);

xmlTag *parseXml(char *xmlFile)
{
    return xmlFile ? parseXmlDoc(xmlFile) : NULL;
}

int main(int argc, char **argv)
{
    xmlTag *root;

    if(argc > 1)
    {
        root = parseXml(argv[1]);
    }
    else
    {
        printf("please specify a xml file as input\n");
        return 0;
    }

    printXmlTree(root, 0);
    freeXmlTree(root);
    root = NULL;
    return 0;
}
