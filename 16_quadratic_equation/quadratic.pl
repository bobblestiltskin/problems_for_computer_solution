#!/usr/bin/perl
use strict;
use warnings;

# solves ax^2 + bx +c = 0
# x = (-b +- sqrt(b^2 - 4ac))/ 2a

(@ARGV == 3) or die "Need 3 constants, a, b and c\n";
my ($a, $b, $c) = @ARGV;

if ($a) {
  my $denominator = $a + $a;
  my $term1 = $b * $b;
  my $term2 = 4 * $a * $c;
  if ($term1 == $term2) {
    print "X is ",-($b / $denominator),"\n";
  } elsif ($term1 > $term2) {
    my $term = sqrt($term1 - $term2);
    my $root1 = ($term - $b)/ $denominator;
    my $root2 = -($term + $b)/ $denominator;

    print "X is $root1 or $root2\n";
  } else {
#    print "NEGATIVE DISCRIMINANT\n";
    my $term = sqrt($term2 - $term1);
    my $real = -($b / $denominator);
    my $imaginary = $term / $denominator;

    print "X is ",$real,"+",$denominator,"i or ",$real,"-",$denominator,"i\n";
  }
} elsif ($b) {
  print "X is ",$c/$b,"\n";
}
