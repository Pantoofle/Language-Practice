#ifndef GENEALOGIE_H
#define GENEALOGIE_H

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define TAILLE_NOM 128
#define NB_MAX_PERSO 256

struct perso{
  char name[TAILLE_NOM];
  struct perso* pere;
  struct perso* mere;
  struct perso* frere_pere;
  struct perso* frere_mere;
  struct perso* enfant;
  struct perso* chaine;
};
typedef struct perso perso;

perso* find(perso* village, char name[TAILLE_NOM]);
perso* add(perso* v, char name[TAILLE_NOM]);
void set_pere(perso* pere, perso* enfant);
void set_mere(perso* mere, perso* enfant);
void display(perso* village);
perso* make_graph(char table[NB_MAX_PERSO][3][TAILLE_NOM]);
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
perso* load ();
void save (perso* v);

#endif
