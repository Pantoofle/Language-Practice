#include<stdio.h>

int main(){
  // METHODE 1
  for(int i = 1; i <= 100; i++){
    printf("%d - ", i);
  }

  printf("\n");


  // METHODE 2
  int i = 0;
  while(i < 100){
    printf("%d - ", ++i);
  }

  printf("\n");

  
  // METHODE 3
  i = 0;
  do{
    printf("%d - ", ++i );
  }while(i < 100);
  
  return 0;
}
