#include<stdio.h>

int main (){
  int i = 0;
  int t[10];

  t[i++] = 1;
  t[i++] = 2;
  i = 1;
  t[++i] = 3;
  t[++i] = 4;
  i = 9;
  t[i--] = 5;
  t[i--] = 6;
  i = 8;
  t[--i] = 7;
  t[--i] = 8;

  for(int j = 0; j < 10; j++){
    printf("t[%i] = %i \n", j, t[j]);
  }



  // Question 2
  int m[6];
  m[0] = 1;
  for (int i = 1; i <= 5; i++){
    m[i] = m[i-1] << 1;
  }

  // Parité :
  int a;
  scanf("%d", &a);
  // Methode 1
  if(a & m[0]){
    printf("%d est impaire \n", a);
  }
  else {
    printf("%d est paire \n", a);
  }
  // Methode 2
  if(   ((a >> 1) << 1) == a   ){
    printf("%d est paire \n", a);
  }
  else {
    printf("%d est impaire \n", a);
  }



  // (b) bit 3
  if(a & m[3]){
    printf("Le 3e bit de %d est 1 \n", a);
  }
  else {
    printf("Le 3e bit de %d est 0 \n", a);
  }

  // (c) dernier octet = 7
  if(a & (m[2] + m[1] + m[0])) {
    printf("Le dernier Octet de %d (%x en hexa) est 7 \n", a, a);
  }
  else {
    printf("Le dernier Octet de %d (%x en hexa) n'est pas 7 \n", a, a);
  }

  // (d) Mettre à 1 le bit 0
  int b = a | m[0];
  printf("En passant le bit 0 à 1, %d vaut %d \n", a, b);

  // (e) Mettre à 1 les bits 1 et 4
  b = a | (m[1] + m[4]);
  printf("En passant les bit 1 et 4 à 1, %d vaut %d \n", a, b);

  // (f) Mettre à 0 les bits 1 et 2
  b = a & ~(m[1] + m[2]);
  printf("En passant les bits 1 et 2 à 0, %d vaut %d \n", a, b);

  // (g) L'octet de poids faible
  b = a & 0xff;
  printf("L'octet de poids faible de %d vaut %x (en hexadecimal) \n", a, b);
}
