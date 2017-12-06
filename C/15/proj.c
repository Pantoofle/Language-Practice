#include<stdio.h>
#include"genealogie.h"

int main(){
  perso* v, *w;
  int i, j;
  char tab[NB_MAX_PERSO][3][TAILLE_NOM] ={
    {"Brandon", "Jihair", "Saoul-Helene"},
    {"Jessica", "Jihair", "Saoul-Helene"},
    {"Jennifer", "Jihair", "Saoul-Helene"},
    {"Jonathan", "Huggy", "Pamela"},
    {"Brenda", "Huggy", "Pamela"},
    {"Kevin",  "Huggy", "Pamela"},
    {"Valery", "Jonathan", "Jennifer"},
    {"Georges", "Jonathan", "Jennifer"},
    {"Francois", "Jihair", "Jessica"},
    {"Charles", "Kevin", "Jessica"},
    {"Jacques", ".", "."}};

  for(i = 11; i<NB_MAX_PERSO; i++){
    for (j = 0; j<3; j++){
      strcpy(tab[i][j], ".");
    }
  }
  
  printf ("Tableau ok \n");
  v = make_graph(tab);
  check (v);
  display(v);
  printf("\n");
  save(v);
  clean(v);
  w = load();
  display(w);
  clean(w);
  return 0;
}
