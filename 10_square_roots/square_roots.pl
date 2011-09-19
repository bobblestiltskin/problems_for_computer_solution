#!/usr/bin/perl
use strict;
use warnings;

use constant DELTA => 0.000001;

(@ARGV == 2) or die "Need 2 numbers - a number and a guess\n";

my $number = $ARGV[0];
my $guess = abs($ARGV[1]);
my $count = 0;
my $too_low;
my $too_high;

while ((abs($number - ($guess * $guess))) > DELTA) {
  if (($guess * $guess) < $number) {
    if (defined $too_high) {
      $guess = ($guess + $too_high)/2;
    } else {
      $too_low = $guess;
      $guess++;
    }
  } else { # guess is too big
    if (defined $too_low) {
      $guess = ($too_low + $guess)/2;
    } else {
      $too_high = $guess;
      $guess--
    }
  }
  $count++;
}

print "NUMBER is $number, ROOT is $guess, COUNT is $count\n";
