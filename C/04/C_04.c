#include<stdio.h>

int main () {

  char nom[50];
  int age;

  printf("Hello World ! \n");
  printf("Veuillez entrer votre nom et age \n");

  printf("Nom : ");
  scanf("%s", nom);
  printf("Age : ");
  scanf("%d", &age);

  printf("Bonjour %s, vous avez vécu environ %d jours ! \n", nom, age*365);


  float a;
  float f;
  printf("Veuillez entrer la longueur du fil et la flèche utilisée\n");
  printf("Fil : ");
  scanf("%f", &a);
  printf("Fleche : ");
  scanf("%f", &f);

  float i = 2*f/a;
  float L = a*(1.+(2./3.)*i*i);
  printf("L = %f \n", L );
  
  return 0;
}
