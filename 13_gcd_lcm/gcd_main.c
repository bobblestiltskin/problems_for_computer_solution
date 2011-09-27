#include "stdio.h"
#include "stdlib.h"

int gcd(int, int);

int main(int argc, char **argv)
{
  if (argc < 3)
  {
    printf("Need at least 2 args\n");
    exit (1);
  }

  int i = argc - 1;
  int g = atoi(argv[i--]);

  do {
    g = gcd(g, atoi(argv[i--]));
  } while (i && (g != 1));

  printf("GCD is %d\n", g);

  exit (0);
}
  
