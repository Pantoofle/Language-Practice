#include <stdio.h>
#include <math.h>
#define MAX 100

int main() {
  int i;
  for(i=MAX/2; i<MAX; i++){
    if(((i%2)==0 || ((i%3)==0)) || ((i%5)==0))
      continue;
    else
      if (((i%7)==0) && ((i%11)==0)) break;
    printf("\ni = %d ", i);
  }
  printf("\nSortie : ");
  printf("\n\ti = %d ", i);
  return 0;
}
