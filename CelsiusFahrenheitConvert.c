#include <stdio.h>

void ConvertTemp(float* temp, char* type){
    if (*type == 'c'){
        *temp = (1.8 * *temp) + 32;
    }
    else if (*type == 'f'){
        *temp = (*temp - 32) * 0.5555;
    }
}

int main()
{
    printf("Enter 'c' to convert Celsius to Fahrenheit \nEnter 'f' to convert Fahrenheit to Celsius \n");
    
    char conversion = 'a';
    while (conversion != 'c' && conversion != 'f'){
        printf("Enter c or f: ");
        scanf(" %c", &conversion);
    }
    
    float temp = 0.00;
    printf("Enter the temperature: ");
    scanf("%f", &temp);
    
    ConvertTemp(&temp, &conversion);
    
    printf("Temperature conversion: %.2f\n", temp);
}
