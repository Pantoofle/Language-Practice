#include<stdio.h>

int main (){
  printf("----- Pays ----- \n"); 
  printf("1. Belgique \n");
  printf("2. Suisse \n");
  printf("3. Canada \n");
  printf("4. Japon \n");
  printf("5. Norvege \n");
  printf("6. France \n");
  printf("Choisissez votre pays (1~6)");

  int choix;
  scanf("%d", &choix);

  // VERSION 1
  if(choix == 1){
    printf("Vous êtes belge ! \n");
  }
  else {
    if(choix == 2){
      printf("Vous êtes suisse ! \n");
    }
    else {
      if(choix == 3){
        printf("Vous êtes canadien ! \n");
      }
      else {
        if(choix == 4){
          printf("Vous êtes japonais ! \n");
        }
        else {
          if(choix == 5){
            printf("Vous êtes un viking ! \n");
          }
          else {
            if(choix == 6){
              printf("Vous êtes francais ! \n");
            }
            else {
              printf("J'ai dit entre 1 et 6... C'est pourtant pas compliqué ! \n");
            }
          }
        }
      }
    }
  }


  // VERSION 2
  if(choix == 1){
    printf("Vous êtes belge ! \n");
  }
  else if(choix == 2){
    printf("Vous êtes suisse ! \n");
  }
  else if(choix == 3){
    printf("Vous êtes canadien ! \n");
  }
  else if(choix == 4){
    printf("Vous êtes japonais ! \n");
  }
  else if(choix == 5){
    printf("Vous êtes un viking ! \n");
  }
  else if(choix == 6){
    printf("Vous êtes francais ! \n");
  }
  else {
    printf("J'ai dit entre 1 et 6... C'est pourtant pas compliqué ! \n");
  }

 
  // VERSION 3
  switch (choix){
  case 1:
    printf("Vous êtes belge ! \n");
    break;
  case 2:
    printf("Vous êtes suisse ! \n");
    break;
  case 3:
    printf("Vous êtes canadien ! \n");
    break;
  case 4:
    printf("Vous êtes japonais ! \n");
    break;
  case 5:
    printf("Vous êtes un viking ! \n");
    break;
  case 6:
    printf("Vous êtes francais ! \n");
    break;
  default:
    printf("J'ai dit entre 1 et 6... C'est pourtant pas compliqué ! \n");
  }


  // Question 4
  // RAS
 
}
