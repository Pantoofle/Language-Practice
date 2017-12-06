#include<stdio.h>

void inverse(int* tab, int size){
  int* p1;
  int* p2;
  int permut;
  p1 = tab;
  p2 = p1 + size -1;
  while(p1 < p2){
    permut = *p1;
    *p1 = *p2;
    *p2 = permut;
    p1 += 1;
    p2 -= 1;
  }
}


int main(){
  int t[] = {1,2,3,4,5,6};
  inverse(t, 6);
  printf("%i - %i - %i \n", t[0], t[1], t[2]);
}
