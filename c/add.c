
#include <stdio.h>
#include "dlfcn.h"

int main()
{

    printf("Opening.....\n");
    void *handle = dlopen("../bin/debug/net6.0/linux-x64/publish/NativeLibrary.so", RTLD_LAZY);

    printf("Associating.....\n");
    typedef int (*myFunc)(int, int);
    myFunc MyImport = dlsym(handle, "add");

    printf("Calling.....\n\n");
    int result = MyImport(5, 3);
    if (result == 8)
    {
        printf("Hoorah! the result is %d, this is correct\n\n", result);
    }
    else
    {
        printf("Oops something is wrong the reult is %d\n\n");
    }
}