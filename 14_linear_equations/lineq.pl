#!/usr/bin/perl
use strict;
use warnings;

# solves
# ax + by = c .. eq1
# dx + ey = f .. eq2

# eq1 * d/a 
# dx + bd/a * y = dc/a .. eq3

# eq2 - eq3
# (ae - bd)/a * y = (af - dc)/a
# y = (af - dc) / (ae - bd)

(@ARGV == 6) or die "Need 6 numbers as input, $!\n";
my ($a, $b, $c, $d, $e, $f) = @ARGV;

print $a,"x + ",$b,"y = ",$c,"\n"; 
print $d,"x + ",$e,"y = ",$f,"\n"; 

my $denominator = ($a*$e - $b*$d);
if ($denominator) {
  my $numerator = ($a*$f - $d*$c);
  my $y = $numerator / $denominator;
  my $x = 0;
  if ($a) {
    $x = ($c - $b*$y) / $a;
  } elsif ($d) {
    $x = ($f - $e*$y) / $d;
  }
  print "X is $x and Y is $y\n";
} else {
  print "NO SOLUTIONS \n";
}
