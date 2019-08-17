#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include "symtab2.h"

int declare = 0;
static list_t* head = NULL;

void insert(char *name, int len, int type, int lineno)
{
    printf("ok3\n");
    list_t* l = (list_t*)malloc(sizeof(list_t));
    l = search(name);

	if (l == NULL)
    {
        printf("ok2\n");
		l = (list_t*) malloc(sizeof(list_t));
		strncpy(l->st_name, name, len);  
		l->st_type = type;

        printf("%s %d\n", l->st_name, l->st_type);

        l->next = head;
        head = l;

		l->lines = (RefList*) malloc(sizeof(RefList));
		l->lines->lineno = lineno;
		l->lines->next = NULL;
		
		printf("Inserted %s for the first time with linenumber %d!\n", name, lineno);
	}
	else
    {
		if(declare == 0)
		{
			RefList *t = l->lines;
			while (t->next != NULL) t = t->next;
			
			t->next = (RefList*) malloc(sizeof(RefList));
			t->next->lineno = lineno;
			t->next->next = NULL;
			printf("Found %s again at line %d!\n", name, lineno);
		}
		else
        {
			fprintf(stderr, "A multiple declaration of variable %s at line %d\n", name, lineno);
 			exit(1);
		}		
	}
}

list_t* search(char *name) 
{ 
    list_t *current = head;  // Initialize current 
    while (current != NULL) 
    { 
        if (strcmp(name,current->st_name) != 0)
        {
            current = current->next; 
        }
        else
        {
            // printf("%s %d", current->st_name, current->st_type);

            // RefList *currentLine = current->lines;

            // while(currentLine!=NULL)
            // {
            //     printf(" %d \n", currentLine->lineno);

            //     currentLine = currentLine->next;
            // }

            break;
        }
        
    } 
    return current; 
} 
 
void symtab_data(FILE * of)
{  
  int i;
  fprintf(of,"------------ ------ ------ ------------\n");
  fprintf(of,"Name         Type   Scope  Line Numbers\n");
  fprintf(of,"------------ ------ ------ ------------\n");
    
}
