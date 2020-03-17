#include <stdio.h>

int main(){
    int a = 16;
    int b = 12;
    int i = gcd(a, b);
    printf("gcd(%d,%d)=%d \n", a, b, i);
    return 0;
}