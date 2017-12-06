#include<stdio.h>
#include<string.h>
#include<math.h>

#define DISPLAY(n) printf("%i \n", n)

#define ABS(x) (x < 0 ? (-x) : (x))

#define PRINT_TYPER(t) ( strcmp(#t, "int") == 0 ? "%i": (strcmp(#t, "double") == 0 ? "%f"  : (strcmp(#t, "char") == 0 ? "%c" : "ERROR" )))


#define PRINT(type, expr) { \
    printf( #expr " = ");                 \
    printf(PRINT_TYPER(type), expr);            \
    printf("\n"); }

int main(){
  int n = -4;

  printf("Fonction display : n = -4 \n");
  DISPLAY(n);
  printf("Calcul de ABS(n) \n");
  n = ABS(n);
  DISPLAY(n);

  printf("\nAppel de PRINT(type, expr) \n");
  PRINT( int , 1+3);
  PRINT( double , 4.0 * atan (1.0));
  PRINT( char, 'c' );
  return 0;
}
