#!/usr/bin/perl
use strict;
use warnings;

# world produced 681.9 metic tonnes of wheat in 2009
# http://en.wikipedia.org/wiki/International_wheat_production_statistics
# how many grains per tonne? that depends on the moisture level!

my $grains = 1;
my $total = $grains;
for (my $square=0; $square < 64; $square++) {
  print "SQUARE - ",$square+1,"\tGRAINS - $grains\tTOTAL - $total\n";
  $grains = $grains + $grains;
  $total += $grains;
}
