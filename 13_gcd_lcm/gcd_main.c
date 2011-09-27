#include "stdio.h"
#include "stdlib.h"

typedef unsigned long long uint64;
/* uint64 gcd(uint64, uint64); */
int gcd(int, int);

int main(int argc, char **argv)
{
  if (argc != 3)
  {
    printf("Need 2 args\n");
    exit (1);
  }

  int u = atoi(argv[1]);
  int v = atoi(argv[2]);
  printf("ARGS ARE %d and %d ", u, v);

  int g = gcd(u, v);
  printf("and GCD is %d\n", g);

  exit (0);
}
  
