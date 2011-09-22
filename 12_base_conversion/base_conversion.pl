#!/usr/bin/perl
use strict;
use warnings;

(@ARGV == 1) or die "Need one integer to convert, $!";

my @numbers = (0 .. 9, 'a' .. 'z');

for (my $base=2; $base<37; $base++) {
  my $number = $ARGV[0];
  print "DECIMAL NUMBER is $number, BASE $base is ";
  my $string = "";
  my $remainder = $number % $base;
  while ($number = int($number/$base)) {
    $string = $numbers[$remainder] . $string;
    $remainder = $number % $base;
  }
  $string = $numbers[$remainder] . $string;
  print $string,"\n";
}
