#include<stdio.h>

int main(){
  printf("Entrez la taille du tableau a creer\n");
  int taille;
  scanf("%d", &taille);
  
  printf("Entrez les valeurs du tableau, une par une.\n ");
  int tab[taille];
  int val;
  int max, min, moy;
  int sum = 0;

  printf("Valeur 1 sur %d \n", taille);
  scanf("%d", &val);
  tab[0] = val;
  max = val;
  min = val;
  sum += val;
  
  for(int i = 1; i<taille ; i++){
    printf("Valeur %d sur %d \n", i+1, taille);
    scanf("%d", &val);
    tab[i] = val;
    if(val > max){max = val;}
    if(val < min){min = val;}
    sum += val;
  }
  printf("Entrée terminée !\n");
  printf("[");
  for(int i = 0; i<taille-1; i++){
    printf("%d, ", tab[i]);
  }
  printf("%d]\n", tab[taille-1]);
  printf("Min : %d\nMax : %d\nMoyenne : %f\n", min, max, ((float)sum)/((float)taille));

  return 0;
}
