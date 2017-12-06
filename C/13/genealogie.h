#ifndef GENEALOGIE_H
#define GENEALOGIE_H

#include<stdio.h>
#include<stdlib.h>
#include<string.h>


struct perso{
  char name[15];
  struct perso* pere;
  struct perso* mere;
  struct perso* frere_pere;
  struct perso* frere_mere;
  struct perso* enfant;
  struct perso* chaine;
};
typedef struct perso perso;

perso* find(perso* village, char name[15]);
perso* add(perso* v, char name[15]);
void set_pere(perso* pere, perso* enfant);
void set_mere(perso* mere, perso* enfant);
void display(perso* village);
perso* make_graph(char table[][3][15], int n);
void cancel_pere(perso* p);
void cancel_mere(perso* p);
perso* sort_alpha(perso* v);
void predecesseurs(perso* p);
void descendants_aux(perso* p, int gen, perso* from);
void descendants(perso* p, int gen);
void descendants_to(perso* p, int gen);
int check_perso(perso* p);
perso* check (perso* v);
void clean(perso* v);

#endif
