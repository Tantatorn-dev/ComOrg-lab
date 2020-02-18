#include <stdio.h>

int main(){
    int a,b;
    int ans;
    scanf("%d %d",&a,&b);

    while(a!=b)
    {
        if(a > b)
            a -= b;
        else
            b -= a;
    }
    printf("%d",a);

}