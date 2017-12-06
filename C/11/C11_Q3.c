#include<stdio.h>
#include<stdlib.h>


void fiboN(int* tab, int i);
void fill(int* tab, int n);
void printTab(int* tab, int n);

int main(){
  int n;
  int* tab;
  printf("Choisir n : ");
  scanf("%d", &n);
  tab = malloc(n);
  fill(tab, n);
  printTab(tab, n);
  printf("\n");
  return 0;
}

void fiboN(int* tab, int i){
  if (i == 0 || i == 1){
    *tab = 1;
    *(tab + 1) = 1;
  }
  else{
    fiboN(tab, i-1);
    *(tab + i) = *(tab + i-1) + *(tab + i-2);
  }
}

void fill(int* tab, int n){
  fiboN(tab, n-1);
}

void printTab(int* tab, int n){
  int i;
  for(i = 0; i<n; i++){
    printf("%d - ", *(tab + i));
  }
}
