#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab2.c"

int main()
{
    printf("ok\n");
    insert("ID",2,INT_TYPE, 10);
    insert("ID2",3,CHAR_TYPE, 20);
    insert("ID5",3,REAL_TYPE, 30);
    declare = 1;
    insert("ID5",3,REAL_TYPE, 40);
    insert("ID5",3,INT_TYPE, 50);

    search("ID5");
}