#include<stdio.h>
#define X 3
#define Y 5

void maxMinSum2(int tab[X][Y], int res[3]);
void maxMinSum1(int tab[Y], int res[3]);

int main(){
  int t[X][Y] = {
    {1,2,3,4,5},
    {6,7,8,9,10},
    {11,12,13,14,15}};
  int res[3];
  int choix;
  
  int i;
  int j;
  for(i = 0; i<X; i++){
    for(j=0; j<Y; j++){
      printf("%d - ", t[i][j]);
    }
    printf("\n");
  }
  maxMinSum2(t, res);
  printf("0. Maximum\n1. Minimum\n2. Moyenne\n");
  scanf("%d", &choix);
  if(choix <2){
    printf("%d \n", res[choix]);
  }
  else {
    printf("%f \n", (float)res[2]/(X*Y) );
  }
  
  return 0;
}

void maxMinSum2(int tab[X][Y], int res[3]){
  int i;
  int local[3];
  maxMinSum1(tab[0], res);
  for (i=1; i<X; i++){
    maxMinSum1(tab[i], local);
    res[2] += local[2];
    if(local[0] > res[0])
      res[0] = local[0];
    if(local[1] < res[1])
      res[1] = local[1];
  }
}

void maxMinSum1(int tab[Y], int res[3]){
  res[0] = tab[0];
  res[1] = tab[0];
  res[2] = tab[0];
  int i;
  for(i=1; i<Y; i++){
    res[2] += tab[i];
    if (tab[i] > res[0])
      res[0] = tab[i];
    if(tab[i] < res[1])
      res[1] = tab[i];
  }
}
