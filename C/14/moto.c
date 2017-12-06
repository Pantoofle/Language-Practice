#include<stdio.h>
#include<stdlib.h>

/* On prépare les entrées des différentes motos*/
#define X_MOTO \
  X(Suzuki, Gsxf, 5000, bleu)\
  X(HarleyDavidson, VRod, 16500, noir)\
  X(Kawasaki, Ninja300, 6000, vert)

#define X(marque, modele, prix, couleur) marque ## _ ## modele, /* X est maintenant un "accesseur"*/
  enum index_e{ /* Si on appelle X(...) il sera remplacé par la marque, suivie du modèle de la moto*/
    X_MOTO /*On recopie ici la définition de toutes les motos.*/
    /* Or dans cette def, il y a X, qui est donc remplacé par marque_modele pour chaque moto*/
    NOMBRE_MOTOS
  };
#undef X // on a plus besoin de X. on l'oublie

#define X(marque, modele, prix, couleur) #marque, // Maintenant, X est juste remplaçée par la marque
char const * const marque_a [] = {
  X_MOTO // On créé un tableau contenant toutes les marques
};
#undef X

#define X(marque, modele, prix, couleur) #modele, // Maintenant, X est juste remplaçée par le modele
char const * const modele_a [] = {
  X_MOTO // On créé un tableau contenant touts les modeles
};
#undef X

#define X(marque, modele, prix, couleur) prix, //Ici, pas besoin de #, l'expression est deja un int
const int prix_a [] = {
  X_MOTO
};

#undef X

#define X(marque, modele, prix, couleur) #couleur, 
char const * const couleur_a [] = {
  X_MOTO
};
#undef X





int main(void){
  int i;
  printf("%lu", sizeof(marque_a));
  for(i=0; i<NOMBRE_MOTOS; i++)
    printf("Marque : %s −Modele : %s − Prix : %d − Couleur : %s \n",
           marque_a [i], modele_a[i], prix_a[i] ,couleur_a[i]);

  return EXIT_SUCCESS;
}
