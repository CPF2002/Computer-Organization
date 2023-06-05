#include <stdio.h>

int factorial(int n){
    if (n == 1 || n == 0){
        return 1;
    }
    else{
        return (n * factorial(n-1));
    }
}

int main()
{
    printf("Insert number: ");
    int number;
    scanf("%d", &number);
    printf("Factorial: %d", factorial(number));

    return 0;
}
