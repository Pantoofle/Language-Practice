#include<stdio.h>

int main () {
  // Question 2
  for (int i = 0; i < 256; i++){
    char c = (char) i;
    printf("%d : %c \n", i, c);
  }

  // Question 4
  long A = 15;
  char B = 'A';
  short C = 10;

  printf("(1) : %i - %li \n", C+3, sizeof(C+3));
  printf("(2) : %i - %li \n", B+1, sizeof(B+1));
  printf("(3) : %i - %li \n", C+B, sizeof(C+B));
  printf("(4) : %i - %li \n", 3*C + 2*B, sizeof(3*C + 2*B));
  printf("(5) : %li - %li \n", 2*B + (A+10)/C, sizeof(2*B + (A+10)/C));
  printf("(6) : %f - %li \n", 2*B + (A+ 10.0)/C, sizeof(2*B + (A+ 10.0)/C));


  // Question 6
  int tab[5] = {3, 124, 12, 42, 9};
  int x;
  int i = -1;

  printf("Entier à rechercher : ");
  scanf("%d", &x);

  if(tab[0] == x)
    i = 0;
  if(tab[1] == x)
    i = 1;
  if(tab[2] == x)
    i = 2;
  if(tab[3] == x)
    i = 3;
  if(tab[4] == x)
    i = 4;

  if(i == -1){
    printf("Pas dans le tableau ! \n");
  }
  else{
    printf("Présent en position %d \n", i);
  }

  // Question 8

  enum jour {Lundi, Mardi, Mercredi, Jeudi, Vendredi, Samedi, Dimanche};
  
  enum jour d = Lundi;
  int ok = 1;
  while (ok){
    switch(d){
    case Lundi:
      printf("Lundi \n");
      break;
    case Mardi:
      printf("Mardi \n");
      break;
    case Mercredi:
      printf("Mercredi \n");
      break;
    case Jeudi:
      printf("Jeudi \n");
      break;
    case Vendredi:
      printf("Vendredi \n");
      break;
    case Samedi:
      printf("Samedi \n");
      break;
    case Dimanche:
      printf("Dimanche \n");
      break;
    default:
      ok = 0;
      break;
    }
    d = d+1;
  }


  // Question 9
  short a;
  short b;
  printf("Entrez les nombres sur lesquels appliquer le XOR \n");
  scanf("%hi %hi", &a, &b);
  printf("%i", a ^ b);
  
  return 0;
}
