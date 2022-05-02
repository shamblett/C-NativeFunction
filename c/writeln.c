
#include <stdio.h>
#include "dlfcn.h"

int main()
{

    printf("Opening.....\n");
    void *handle = dlopen("../bin/debug/net6.0/linux-x64/publish/NativeLibrary.so", RTLD_LAZY);

    printf("Associating.....\n");
    typedef int (*myFunc)(char* text);
    myFunc MyImport = dlsym(handle, "write_line");

    printf("Calling.....\n\n");
    int result = MyImport("Writeln test");
    if (result == 0)
    {
        printf("Hoorah! the result is %d, this is correct\n\n", result);
    }
    else
    {
        printf("Oops something is wrong the reult is %d\n\n");
    }
}