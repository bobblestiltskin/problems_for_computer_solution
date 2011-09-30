#!/usr/bin/perl
use strict;
use warnings;

# sums b + bx + bx^2 + bx^3 + .. bx^(n-1)

(@ARGV == 3) or die "Need a constant, initial value for x and number of terms\n";

my ($b, $x, $n) = @ARGV;

my $gsum = 0;
for (my $i=0; $i < $n; $i++) {
  $gsum += $b * ($x ** $i);
}
print "SUM is $gsum\n";
