#include <stdio.h>

int main() {

  int x = 5;
  int y = 0;

  x++;
  y = x++;
  y = ++x;
  printf("%d \n", x);
  printf("%d \n", y);

  return 0;
}
