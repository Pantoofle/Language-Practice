#include<stdio.h>
#include<stdlib.h>

int* alloue_vecteur(int dimension, int val);
void libere_vecteur(int* vecteur);

int main(){
  int* p = alloue_vecteur(3, 4);
  printf("%i, %i, %i, %i \n", p[0], p[1], p[2], p[3]);
  libere_vecteur(p);
  printf("%i, %i, %i, %i \n", p[0], p[1], p[2], p[3]);
  return 0;
}

int* alloue_vecteur(int dimension, int val){
  int* p = malloc(dimension * sizeof(val));
  int i;

  for(i = 0; i < dimension; i++){
    *(p+i) = val;
  }
  return p;
}

void libere_vecteur(int* vecteur){
  free(vecteur);
}
