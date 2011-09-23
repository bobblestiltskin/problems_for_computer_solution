#!/usr/bin/perl
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
# derived from c++ code at http://en.wikipedia.org/wiki/Binary_GCD_algorithm
  my ($u, $v) = @_;

  return $u | $v if ($u == $v or not $u or not $v);
  
  if (not($u % 2)) { # even u
    if (not($v % 2)) { # if u and v are even
      return (2 * gcd($u/2, $v/2));
    } else { # u is even and v is odd
      return gcd($u/2, $v)
    }
  } elsif (not($v %2)) { # if u is odd and v is even
    return gcd($u, $v/2);
  } else { # both are odd
    if ($u > $v) {
      return gcd(($u - $v)/2, $v);
    } else {
      return gcd(($v - $u)/2, $u);
    }
  }
}
