#include<stdio.h>

int main(){
  FILE* fichier;
  int nchar = 0;
  int nmots = 0;
  int nphrases = 0;
  char path[128];
  char c;
  int inWord;

  
  printf("Fichier à lire : ");
  scanf("%s", path);

  fichier = fopen(path, "r");
  c = fgetc(fichier);

  while(c != EOF){
    nchar++;
    if (inWord){
      if(c<(int)'A' || c>(int)'z') {
        nmots++;
        inWord = 0;
      }
    }
    else{
      if(c>(int)'A' && c<(int)'z')
        inWord = 1;
    }
    if ((char)c == '.' || (char)c == '!') nphrases++;
    c = (char)fgetc(fichier);
  }

  fclose(fichier);
  printf("Nombre de caracteres : %i \nNombre de mots : %i\nNombre de phrases : %i\n", nchar, nmots, nphrases);
  return 0;
}
