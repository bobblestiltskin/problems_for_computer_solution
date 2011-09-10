#!/usr/bin/perl
use strict;
use warnings;

my $pay = 0.01;
my $total = $pay;
for (my $period=0; $period < 24; $period++) {
  print "PERIOD - ",$period+1,"\tPAY - $pay\tTOTAL - $total\n";
  $pay = $pay + $pay;
  $total += $pay;
}
