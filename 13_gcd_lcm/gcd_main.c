#include "stdio.h"
#include "stdlib.h"

int main(int argc, char **argv)
{
  if (argc != 3)
  {
    printf("Need 2 args\n");
    exit (1);
  }
  printf("ARGS ARE %s and %s and GCD is %d\n", argv[1], argv[2], gcd(atoi(argv[1]), atoi(argv[2])));
  exit (0);
}
  
