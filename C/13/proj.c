#include<stdio.h>
#include"genealogie.h"

int main(){
  perso* v;
  char tab[][3][15] ={
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
 
  v = make_graph(tab, 11);
  check (v);
  display(v);
  printf("\n");

  clean(v);
  return 0;
}
