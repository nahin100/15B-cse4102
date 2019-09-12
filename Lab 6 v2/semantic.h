int id_check(char *st_name)
{
    list_t* id = search(st_name);

    if (id==NULL)
    {
        fprintf(stderr, "%s is not declared\n", st_name);
        return -1;
    }

    return id->address;
}