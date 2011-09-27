#!/usr/bin/perl -w
use strict;
use warnings;

(@ARGV > 1) or die "Need at least 2 integers, $!";

my $gcd = pop @ARGV;
my $lcm = $gcd;
while (my $value = pop @ARGV) {
  $gcd = gcd($gcd, $value);
  $lcm = $lcm * $value / gcd($lcm, $value);
}
print "GCD is $gcd\n";
print "LCM is $lcm\n";

sub gcd {
# derived from c code at http://en.wikipedia.org/wiki/Binary_GCD_algorithm
  my ($u, $v) = @_;
  my $shift;
 
  # GCD(0,x) := x 
  return $u | $v if ($u == 0 || $v == 0);
 
  # Let shift := lg K, where K is the greatest power of 2 dividing both u and v.
  for ($shift = 0; (($u | $v) & 1) == 0; ++$shift) {
    $u >>= 1;
    $v >>= 1;
  }
 
  $u >>= 1 while (not ($u & 1));

  # From here on, u is always odd.
  do {
      $v >>= 1 while (not ($v & 1));  # Loop X

      # Now u and v are both odd, so diff(u, v) is even.
      # Let u = min(u, v), v = diff(u, v)/2.
      if ($u < $v) {
          $v -= $u;
      } else {
          my $diff = $u - $v;
          $u = $v;
          $v = $diff;
      }
      $v >>= 1;
  } while ($v != 0);
 
  return $u << $shift;
}
