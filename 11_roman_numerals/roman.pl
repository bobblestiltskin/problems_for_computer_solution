#!/usr/bin/perl
use strict;
use warnings;

(@ARGV == 2) or die "Need two roman numerals, $!";

my $arabic0 = r2a(lc($ARGV[0]));
my $arabic1 = r2a(lc($ARGV[1]));

sub r2a {
  my $r2a = {i => 1,
             v => 5,
             x => 10,
             l => 50,
             c => 100,
             d => 500,
             m => 1000,
  };

  my $roman = shift;
  my @roman = split(//, $roman);
  my $minus = 0;
  my $arabic = $r2a->{$roman[-1]};
  for (my $i = $#roman; $i > 0; $i--) {
    if ($minus) {
      if ($r2a->{$roman[$i - 1]} > $r2a->{$roman[$i]}) {
        $minus = 0;
      }
    } else {
      if ($r2a->{$roman[$i - 1]} < $r2a->{$roman[$i]}) {
        $minus = 1;
      }
    }
    if ($minus) {
      $arabic -= $r2a->{$roman[$i - 1]};
    } else {
      $arabic += $r2a->{$roman[$i - 1]};
    }
  }
  
  print "ROMAN is $roman, ARABIC is $arabic\n";
  return $arabic;
}
