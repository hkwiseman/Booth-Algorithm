#include<stdio.h>

long long int booths(int,int);
// Assembly implementation of Booth's algorithm

int main ()
{

   int x, y;
   long long int answer;

   // User input of numbers to multiply 
   printf("Enter two integers: \n");
   scanf("%d %d", &x, &y);

   // Call to booth function 
   answer = booths(x,y);

   // Output of original values and answer
   printf("%d * %d = %lld\n", x, y, answer);

   return 0;
}
