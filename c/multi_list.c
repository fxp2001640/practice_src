typedef struct stu
{
    char name[32];
    node_t cls_ls;
}stu_t;

typedef struct cls
{
    char name[32];
    node_t stu_ls;
}cls_t;

typedef struct node
{
    struct node *stu_next;
    struct node *cls_next;
}node_t;

stu_t *create_student(char *name)
{
    stu_t *stu;

    stu = (stu_t *)calloc(1, sizeof(*stu));
    if(!stu)
    {
        return NULL;
    }

    strncpy(stu->name, name, sizeof(stu->name));

    /*link to self*/
    stu->cls_ls.cls_next = &(stu->cls_ls);

    return stu;
}

cls_t *create_class(char *name)
{
    cls_t *cls;

    cls = (cls_t *)calloc(1, sizeof(*cls));
    if(!cls)
    {
        return NULL;
    }

    strncpy(cls->name, name, sizeof(cls->name));

    /*link to self*/
    cls->stu_ls.stu_next = &(cls->stu_ls);

    return cls;
}

void stu_register_cls(stu_t *stu, cls_t *cls)
{
    node_t *node;

    node = (node_t *)malloc(sizeof(*node));
    if(!node)
    {
        return;
    }

    /*insert node to cls list of student*/
    node->cls_next = stu->cls_ls.cls_next;
    stu->cls_ls.cls_next = node;

    /*insert node to stu list of class*/
    node->stu_next = cls->stu_ls.stu_next;
    cls->stu_ls.stu_next = node;
}

void print_class_of_student(stu_t *stu)
{
    node_t *cls, *stu;
    cls_t *ret_cls;

    for(cls = stu->cls_ls.cls_next; cls != (&(stu->cls_ls)); cls = cls->cls_next)
    {
        for(stu = cls->stu_next; stu->cls_next; stu = stu->next)
        {
            /*just loop*/
        }

        ret_cls = (cls_t *)(stu - (&(((cls_t *)0)->stu_ls)));
        printf("class = %s\n", ret_cls->name);
    }
}
