#include "stdio.h"
#include "stdlib.h"

typedef unsigned long long uint64;
uint64 gcd(uint64, uint64);

int main(int argc, char **argv)
{
  if (argc != 3)
  {
    printf("Need 2 args\n");
    exit (1);
  }

int i;
for (i=0;i<3;i++)
  printf("I is %d and arg is %s\n", i, argv[i]);

  uint64 u = strtoull(argv[1], (char **) NULL, 10);
  printf("ARGS ARE %llu\n", u);
  uint64 v = strtoull(argv[2], (char **) NULL, 10);
  printf("and %llu\n", v);

  uint64 g = gcd(u, v);
  printf("and GCD is %llu\n", g);


  exit (0);
}
  
