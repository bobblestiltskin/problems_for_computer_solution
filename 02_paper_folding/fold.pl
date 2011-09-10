#!/usr/bin/perl
use strict;
use warnings;

(@ARGV == 1) or die "Please pass an integer parameter to this program, $!";

use constant INCHES_PER_FOOT => 12;
use constant FEET_PER_MILE => 5280;

my $paper = 0.01;
for (my $count = 0; $count < $ARGV[0]; $count++) {
  print "FOLDS - $count\tTHICKNESS - ";
  if ($paper > FEET_PER_MILE * INCHES_PER_FOOT) {
    print int($paper/(FEET_PER_MILE * INCHES_PER_FOOT))," miles, ",int($paper/INCHES_PER_FOOT)," feet and ",$paper % INCHES_PER_FOOT," inches\n";
  } elsif ($paper > INCHES_PER_FOOT) {
    print int($paper/INCHES_PER_FOOT)," feet and ",$paper % INCHES_PER_FOOT," inches\n";
  } else {
    print $paper, " inches\n";
  }
  $paper = $paper * 2;
}
