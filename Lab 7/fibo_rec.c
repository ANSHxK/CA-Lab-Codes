
#include <stdio.h>

int fibo(int n)
{
    if (n == 0 || n == 1)
        return n;
    else
        return fibo(n - 1) + fibo(n - 2);
}
int main()
{
    int n;
    printf("Enter the value of n: ");
    scanf("%d", &n);
    //  print terms of fibonacci series
    for (int i = 0; i < n; i++)
    {
        printf("%d ", fibo(i));
    }
    return 0;
}