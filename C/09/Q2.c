#include<stdio.h>

int main(){
  int TAILLE_MAX = 50;
  int taille;
  int tab[51][51];

  for(int i = 0; i <= TAILLE_MAX; i++){
    for(int j = 0; j <= TAILLE_MAX; j++){
      tab[i][j] = 0;
    }
  }
  
  printf("Taille du triangle de Pascal souhaité : ");
  scanf("%d", &taille);

  tab[0][1] = 1;
  for(int i = 1; i < taille; i++){
    for(int j = 1; j <= i+1; j++){
      tab[i][j] = tab[i-1][j] + tab[i-1][j-1];
    }
  }

  for(int i = 0; i < taille; i++){
    for(int j = 1; j <= i+1; j++){
      printf("%d ", tab[i][j]);
    }
    printf("\n");
  }

}
