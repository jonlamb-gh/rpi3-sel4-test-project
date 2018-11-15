#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include <sel4/sel4.h>

int main(
        int argc,
        char **argv)
{
    printf("\nHello World\n\n");

    seL4_DebugHalt();
    while(1);
}
