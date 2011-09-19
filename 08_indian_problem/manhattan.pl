#!/usr/bin/perl
use strict;
use warnings;

my $sum = 24;
my $date = 1626;
my $rate = 2;

while ($date < 2012) {
  $rate++ unless ($date % 100);
  printf("DATE %d, RATE %d, SUM %.2f\n", $date, $rate, $sum);
  $sum = $sum * (100 + $rate) / 100;
  $date++;
}
