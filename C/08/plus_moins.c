#include<stdio.h>
#include<stdlib.h>
#include<time.h>


int main (){
  srand(time(NULL));
  int MAX = 100;
  int MAX_PLAYER = 2;
  int MAX_MANCHE = 5;
  int cont = 1;
  
  int chance_manche[] = {5, 10, 25, 50, 100};
  printf("###  PLUS-OU-MOINS  ### \n");
  printf("Pas besoin de rappeler les regles, \n Vous les connaissez.\n");

  printf("Le nombre est entre 1 et %d \n", MAX);

  while(cont){
    int score[] = {0, 0};
    
    for(int jeu = 1; jeu <= 3; jeu++){
      for(int p = 0; p < MAX_PLAYER; p++){
        int manche = 0;
        printf("\nPARTIE %d - MANCHE %d - Joueur %d - %d essais\n", jeu, manche+1, p+1, chance_manche[manche]);
        int m = (rand() % 100) +1;
        int c = 0;
        int essai = 0;
        
        while((c != m) & (manche < MAX_MANCHE) ){
          printf("Alors ? Une idée du nombre caché ?\n");
          scanf("%d", &c);
          if(c < m){
            printf("Plus grand !\n");
          }
          else if(c > m){
            printf("Plus petit !\n");
          }
          essai++;
          
          if((c != m) & (essai == chance_manche[manche])){
            score[p] += essai;
            manche++;
            
            printf("\nPARTIE %d - MANCHE %d - Joueur %d - %d essais\n", jeu, manche+1, p+1, chance_manche[manche]);
            
            m = (rand() % 100) +1;
            c = 0;
            essai = 0;
          }
        }
        printf("TROUVÉ ! Bravo ! \n");
        score[p] += essai;
      }
    }
    
    printf("\n\nRESULTATS ! \n");
    int winner = 0;
    int min_score = score[0];
    for(int i = 0; i < MAX_PLAYER; i++){
      printf("Joueur %d : %d points ! \n", i+1, score[i]);
      
      if(score[i] < min_score){
        winner = i;
        min_score = score[i];
      }
    }
    printf("\n\nVAINQUEUR : JOUEUR %d, AVEC %d POINTS !!! \n", winner+1, min_score);
    
    printf("Voulez vous :\n1.Faire une autre partie\n2.Quitter ?\n");
    scanf("%d", &cont);
    cont = cont % 2;
  }
  return 0;
}
