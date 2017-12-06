#include "genealogie.h"

perso* find(perso* village, char name[15]){
  while(village != NULL){
    if(strcmp(village->name, name) != 0){
      village = village->chaine;
    }
    else{
      break;
    }
    if(village == NULL){
      break;
    }
  }
  return(village);
}

perso* add(perso* v, char name[15]){

  perso* p = malloc( sizeof(perso) );
  
  strcpy(p->name, name);
  p->frere_pere = p;
  p->frere_mere = p;
  p->pere = NULL;
  p->mere = NULL;
  p->enfant = NULL;
  // On insère en 2e position.
  if(v == NULL){
    p->chaine = NULL;
  }
  else {
    p->chaine = v->chaine;
    v->chaine = p;
  }
  printf("%s ajouté !\n", p->name);
  return p;
}

void set_pere(perso* pere, perso* enfant){
  enfant->pere = pere;
  if(pere->enfant == NULL){
    pere->enfant = enfant;
    enfant->frere_pere = enfant;
  }
  else{
    enfant->frere_pere = (pere->enfant)->frere_pere;
    (pere->enfant)->frere_pere = enfant;
  }
} 

void set_mere(perso* mere, perso* enfant){
  enfant->mere = mere;
  if(mere->enfant == NULL){
    mere->enfant = enfant;
    enfant->frere_mere = enfant;
  }
  else{
    enfant->frere_mere = (mere->enfant)->frere_mere;
    (mere->enfant)->frere_mere = enfant;
  }
}

void display(perso* village){
  while(village){
    printf("Nom : %s\n", village->name);
    // if((*(*village).pere).name)
    printf("\tPère : %s\n", (village->pere)->name);
    // if((*(*village).mere).name)
    printf("\tMère : %s\n", (village->mere)->name);
    // if((*(*village).frere_pere).name)
    printf("\tFratterie par père : %s \n", (village->frere_pere)->name);
    // if((*(*village).frere_mere).name)
    printf("\tFratterie par Mère : %s\n", (village->frere_mere)->name);
    // if((*(*village).enfant).name)
    printf("\tEnfant : %s\n", (village->enfant)->name);
    // if((*(*village).chaine).name)
    printf("\tChaine : %s\n", (village->chaine)->name);
    village = village->chaine;
  }
}

perso* make_graph(char table[][3][15], int n){
  perso* v = NULL;
  perso* fils;
  perso* pere;
  perso* mere;
  char nfils[15];
  char npere[15];
  char nmere[15];
  int i;

  for(i=0; i<n; i++){
    strcpy(nfils, table[i][0]);
    strcpy(npere, table[i][1]);
    strcpy(nmere, table[i][2]);
    fils = find(v, nfils);
    pere = find(v, npere);
    mere = find(v, nmere);
    if (fils == NULL){
      fils = add(v, nfils);
    }
    if(v == NULL){
      v = fils;
    }
    if ((pere == NULL) && (strcmp(npere, ".") != 0)){
      pere = add(v, npere);
    }
    if (mere == NULL && (strcmp(nmere, ".") != 0)){
      mere = add(v, nmere);
    }
    if(strcmp(npere, ".") != 0){
      set_pere(pere, fils);
    }
    if(strcmp(nmere, ".") != 0){
      set_mere(mere, fils);
    }
  }
  printf("\nGraph terminé ! \n");
  return v;
}

void cancel_pere(perso* p){
  perso* pere = p->pere;
  perso* frere = p;
  
  p->pere = NULL;
  while(frere->frere_pere != p){
    frere = frere->frere_pere;
  }
  frere->frere_pere = p->frere_pere;
  p->frere_pere = p;

  if(frere==p){
    pere->enfant = NULL;
  }
  else{
    pere->enfant = frere;
  }
}

void cancel_mere(perso* p){
  perso* mere = p->mere;
  perso* frere = p;
  
  p->mere = NULL;
  while(frere->frere_mere != p){
    frere = frere->frere_mere;
  }
  frere->frere_mere = p->frere_mere;
  p->frere_mere = p;

  if(frere==p){
    mere->enfant = NULL;
  }
  else{
    mere->enfant = frere;
  }
}

perso* sort_alpha(perso* v){
  perso* res = v;
  perso* q = NULL;
  perso* qs = v;
  perso* qss = v->chaine;

  int ok = 1;

  printf("Debut sorting \n");
  while (ok){
    ok = 0;
    while(qss != NULL){
      if(strcmp(qs->name, qss->name) > 0){
        qs->chaine = qss->chaine;
        qss->chaine = qs;
        if(q){
          q->chaine = qss;
        }
        else{
          res = qss;
        }
        ok = 1;
      }
      q = qs;
      qs = qss;
      qss = qss->chaine;
    }
    q = NULL;
    qs = v;
    qss = v->chaine;
  }

  return res;
}

void predecesseurs(perso* p){
  if (p != NULL){
    predecesseurs(p->pere);
    predecesseurs(p->mere);
    printf("%s - ", p->name);
  }
}



void descendants_aux(perso* p, int gen, perso* from){
  perso* q;
  if(p == NULL)
    return;
  if(from == NULL){
    descendants_aux(p->enfant, gen-1, p);
    return;
  }
  
  if(from == p->pere){
    q = p->frere_pere;
    while(q != p){
      if(gen == 0)
        printf("%s - ", q->name);
      if(gen != 0)
        descendants_aux(q->enfant, gen-1, q);
      q = q->frere_pere;
    }
  }
  
  if(from == p->mere){
    q = p->frere_mere;
    printf("%s - ", p->name);
    while(q != p){
      if(gen == 0)
        printf("%s - ", q->name);
      if(gen != 0)
        descendants_aux(q->enfant, gen-1, q);
      q = q->frere_mere;
    }
  }
}

void descendants(perso* p, int gen){
  descendants_aux(p, gen, NULL);
}

void descendants_to(perso* p, int gen){
  int i;
  printf("Génération 0 : %s \n", p->name);
  for(i = 1; i<=gen; i++){
    printf("Géneration %i : ", i);
    descendants(p, i);
    printf("\n");
  }
}

int check_perso(perso* p){
  int i = 1;
  perso* q = p->frere_pere;

  while(q != p){
    if (q == p->pere)
      i = 0;
    q = q->frere_pere;
  }

  q = p->frere_mere;
  while(q != p){
    if (q == p->mere)
      i = 0;
    q = q->frere_mere;
  }

  if(p == p->pere || p == p->mere)
    i = 0;

  return i;
}


perso* check (perso* v){
  int i;
  while(v != NULL){
    printf("Verification : %s : ", v->name);
    i = check_perso(v);
    if(i == 0){
      printf("Erreur \n");
      break;
    }
    printf("Ok \n");
    v = v->chaine;
  }
  return v;
}

void clean(perso* v){
  perso* p;
  while(v != NULL){
    printf("Néttoyage de : %s \n", v->name);
    p = v->chaine;
    free(v);
    v = p;
  }
}
