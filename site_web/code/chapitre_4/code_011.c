#include <stdio.h>
#include <stdlib.h>

#define MAXIMUM 100
int tab[MAXIMUM];
int sum;

int main()
{
    int i;
    srand(1970);
    for (i = 0; i < MAXIMUM; i++)
        tab[i] = rand() % 10;
    sum = 0;
    for (i = 0; i < MAXIMUM; i++)
        sum += tab[i];
    printf("sum = %d\n", sum);
    return 0;
}