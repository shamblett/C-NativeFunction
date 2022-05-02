
#include <stdio.h>
#include <string.h>
#include "dlfcn.h"

int main()
{

    printf("Opening.....\n");
    void *handle = dlopen("../bin/debug/net6.0/linux-x64/publish/NativeLibrary.so", RTLD_LAZY);

    printf("Associating.....\n");
    typedef char* (*myFunc)(char* text1, char* text2);
    myFunc MyImport = dlsym(handle, "sumstring");

    printf("Calling.....\n\n");
    char* result = MyImport("Hello ", "world");
    if (strcmp(result,"Hello world") == 0)
    {
        printf("Hoorah! the result is %s, this is correct\n\n", result);
    }
    else
    {
        printf("Oops something is wrong the reult is %s\n\n");
    }
}