#include<stdio.h>

int main(){
  printf("=== Bataille Navale ===\n\n");

  // Placement des navires
  int tailles[] = {3,3,2};
  int nb_bateaux = 3;
  int taille = 5;

  int grilles[4][5][5];
  for(int i = 0; i<5; i++){
    for(int j = 0; j <10; j++){
      grilles[0][i][j] = 0;
      grilles[1][i][j] = 0;
      grilles[2][i][j] = 0;
      grilles[3][i][j] = 0;
    }
  }

  for(int p = 0; p<2; p++){
    printf("Joueur %d, placez vos navires ! \n", p+1);
    for(int b = 0; b < nb_bateaux; b++){
      printf("Placez le bateau %d, de taille %d \n", b+1, tailles[b]);
      printf("Orientation : \n1. Horizontal\n2. Vertical\n");
      int orientation;
      scanf("%d", &orientation);
      orientation = orientation % 2;
      
      int x, y;
      printf("Case du bateau (ligne, puis colonne) : ");
      scanf("%d", &x);
      scanf("%d", &y);
      int t_bateau = tailles[b];
      while(t_bateau--){
        grilles[p][x-1][y-1] = 1;
        if(orientation){y++;}
        else{x++;}
      }
      
      // AFFICHAGE DE LA GRILLE
      printf("  ");
      for(int i = 0; i < taille; i++){
        printf("%d ", i+1);
      }
      
      for(int i = 0; i < taille; i++){
        printf("\n%d ", i+1);
        for(int j = 0; j < taille; j++){
          if(grilles[p+2][i][j] == 0){printf("  ");}
          if(grilles[p+2][i][j] == 1){printf("X ");}
        }
      }
      printf("\n=======");
      for(int i = 0; i < taille; i++){
        printf("\n%d ", i+1);
        for(int j = 0; j<taille; j++){
          if(grilles[p][i][j] == 0){printf("  ");}
          if(grilles[p][i][j] == 1){printf("0 ");}
          if(grilles[p][i][j] == 2){printf("X ");}
        }
      }
      printf("\n"); 
    }
    
    int i = 50;
    while(i--){printf("\n");}
  }

  // Decompte des vies
  int vies1 = 0;
  int vies2 = 0;
  for(int i = 0; i < taille; i++){
    for(int j = 0; j < taille; j++){
      if(grilles[0][i][j] == 1){vies1 += 1;}
      if(grilles[1][i][j] == 1){vies2 += 1;}
    }
  }


  // PARTIE
  while((vies1 != 0) & (vies2)!= 0){
    for(int p = 0; p < 2; p++){
      
      // AFFICHAGE DE LA GRILLE
      printf("  ");
      for(int i = 0; i < taille; i++){
        printf("%d ", i+1);
      }
      
      for(int i = 0; i < taille; i++){
        printf("\n%d ", i+1);
        for(int j = 0; j < taille; j++){
          if(grilles[p+2][i][j] == 0){printf("  ");}
          if(grilles[p+2][i][j] == 1){printf("X ");}
        }
      }
      printf("\n============");
      for(int i = 0; i < taille; i++){
        printf("\n%d ", i+1);
        for(int j = 0; j<taille; j++){
          if(grilles[p][i][j] == 0){printf("  ");}
          if(grilles[p][i][j] == 1){printf("0 ");}
          if(grilles[p][i][j] == 2){printf("X ");}
        }
      }
      printf("\n"); 
        
      int adv = (p+1)%2;
      int x, y;
      printf("Joueur %d, FEU !\nAux coordonnées : ", p+1);
      scanf("%d", &x);
      scanf("%d", &y);
      if(grilles[adv][x-1][y-1] == 1){
        grilles[adv][x-1][y-1] = 2;
        grilles[p+2][x-1][y-1] = 1;
        if(p){vies1--;}
        else{vies2--;}
        printf("Touché ! \n");
      }
      else {printf("Raté !");}
      int i = 50;
      while(i--){printf("\n");}   
    }
  }

  if(vies1){
    printf("VICTOIRE DU JOUEUR 1 !!!\n");
  }
  else if(vies2){
    printf("VICTOIRE DU JOUEUR 2 !!!\n");
  }
  else {
    printf("Match nul, Bien joué !\n");
  }
  
  return 0;
}
