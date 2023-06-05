#include <stdio.h>
#include <stdlib.h>

void PrintArray(int* array, int size) {
   for (int j = 0; j < size; ++j) {
      printf("%d ", array[j]);
   }
}

// Return the first n Fibonacci numbers
// fibonacci(0) = 0, fibonacci(1) = 1, fibonacci(2) = 1
// Ex: n = 5, seq = 0 1 1 2 3
int* Fibonacci(int n) {
   int* seq;
   int j;

   /* Type your code here. */
   //fib = fib-1 + fib-2
   seq = (int*) malloc(sizeof(int) * n); //reserves the amount of space for sequence
   if (n == 0)
      seq[0] = 0;
   else if (n <= 1){
      seq[0] = 0;
      seq[1] = 1;
   }
   else{
      seq[0] = 0;
      seq[1] = 1;
      for (int i = 2; i < n; i++){
         seq[i] = seq[i-1] + seq[i-2];
      }
   }
   return seq;
}

// Return sequence of squares for 1..n (inclusive)
// Ex: sqrn = 3, seq = 1 4 9
int* Squares(int n) {
   int* seq;

   /* Type your code here. */
   seq = (int*) malloc(sizeof(int) * n); //reserves the amount of space for sequence
   for (int i = 1; i <= n; i++){
      seq[i-1] = i * i;
   }

   return seq;
}

// Return an array that is a copy of array1 followed by
// the elements of array2
int* Concatenate(int* array1, int size1, int* array2, int size2) {
   int j;
   int* seq;

   /* Type your code here. */
   seq = (int*) malloc(sizeof(int) * (size1 + size2)); //reserves the amount of space for sequence
   for (int i = 0; i < size1; i++){
      seq[i] = array1[i];
   }
   for (int i = 0; i <= size2; i++){
      seq[i + size1] = array2[i];
   }

   return seq;
}

int main(void) {

   int fibn;                                 // seq of first fibn Fibonacci numbers
                                             // Ex: fibn = 5, seq = 0 1 1 2 3
   int sqrn;                                 // number of squares starting with 1
                                             // Ex: sqrn = 3, seq = 1 4 9
   scanf("%d %d", &fibn, &sqrn);

   int* fibs;
   int* sqrs;
   int* conc;

   fibs = Fibonacci(fibn);
   PrintArray(fibs, fibn);
   printf("\n");

   sqrs = Squares(sqrn);
   PrintArray(sqrs, sqrn);
   printf("\n");

   conc = Concatenate(fibs, fibn, sqrs, sqrn);
   PrintArray(conc, fibn + sqrn);
   printf("\n");

   return 0;
}

