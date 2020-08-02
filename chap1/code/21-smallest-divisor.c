#include<stdio.h>
#include<math.h>

int smallest_divisor(int n){
   double t = sqrt(n);
   for(int i = 2; i <= t; ++i){
	if(n % i == 0) return i;
   }
   return n;
}

int main(){
  printf("smallest divisor for 199   is %3d\n", smallest_divisor(199));
  printf("smallest divisor for 1999  is %3d\n", smallest_divisor(1999));
  printf("smallest divisor for 19999 is %3d\n", smallest_divisor(19999));
  return 0;
}
 
