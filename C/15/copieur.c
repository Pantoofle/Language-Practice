#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>


#define PATH_LENGTH 128

#define TAILLE_BUFFER 64000

int copy(char source[PATH_LENGTH], char target[PATH_LENGTH]);

int main(){
  char source [PATH_LENGTH];
  char destination[PATH_LENGTH];
  
  printf("Fichier source :");
  scanf("%s", source);

  printf("Fichier destination :");
  scanf("%s", destination);

  copy(source, destination);
  return 0;
}



int copy(char source[PATH_LENGTH], char target[PATH_LENGTH]){
  int from;
  int to;
  int buf[TAILLE_BUFFER];
  int run = 1;
  int perm;
  int ok = 1;

  perm = access(source, R_OK | W_OK | X_OK | F_OK);
  
  from = open(source, O_RDONLY, S_IREAD);
  if(from == -1){
    printf("Erreur lecture du fichier origine. Errno : %i\n", errno);
    return (-1);
  }
    
  to = open(target, O_WRONLY|O_CREAT, S_IWRITE );
  if(to == -1){
    printf("Erreur lecture du fichier destination. Errno : %i\n", errno);
    return (-1);
  }
  printf("Ouverture des fichiers OK\n");
  while(run){
    run = read(from, buf, TAILLE_BUFFER);
    if(run > 0){
      if(write(to, buf, TAILLE_BUFFER) == -1){
        printf("Erreur d'ecriture. errno : %i \n", errno);
      }
    }
    else if (run == -1) {
      run = 0;
      printf("Erreur de lecture. errno : %i \n", errno);
    }
  }

  printf("Ecriture des permissions...\n");
  ok = chmod(target, perm);
  if(ok != 0)
    printf("Erreur lors de l'attribution des permissions\n");
  
  printf("Ecriture terminée \n");
  if(close(from) == -1)
    printf("Erreur de fermeture du fichier source. errno : %i \n", errno);
  if(close(to) == -1)
    printf("Erreur de fermeture du fichier destination. errno : %i \n", errno);
  printf("Fichiers fermés, ecriture complete \n");
  return 0;
}


