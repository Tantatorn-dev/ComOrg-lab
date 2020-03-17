#include <stdio.h>

int main(){
    int a = 7;
    int b = 4;
    int i = modulo(a, b);
    printf("%d %% %d = %d \n", a, b, i);
    return 0;
}