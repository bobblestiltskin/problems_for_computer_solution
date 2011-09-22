#!/usr/bin/perl
use strict;
use warnings;

(@ARGV == 2) or die "Need two roman numerals, $!";

my $roman0 = uc($ARGV[0]);
my $roman1 = uc($ARGV[1]);
my $arabic0 = r2a(lc($roman0));
my $arabic1 = r2a(lc($roman1));
#my $roman0 = uc(a2r($arabic0));
#my $roman1 = uc(a2r($arabic1));
my $sum = uc(a2r($arabic0 + $arabic1));
my $product = uc(a2r($arabic0 * $arabic1));
#for (my $i=901; $i < 1000; $i++) {
#  a2r($i);
#}
print "SUM of $roman0 and $roman1 is $sum\n";
print "PRODUCT of $roman0 and $roman1 is $product\n";

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
  
#  print "ROMAN is $roman, ARABIC is $arabic\n";
  return $arabic;
}

sub a2r {
  my $arabic = shift;

  my $roman = "";
#  print "ARABIC is $arabic, ";
  my $thousands = int($arabic / 1000);
  $arabic = $arabic % 1000;
  $roman = 'm' x $thousands;
  if ($arabic >= 900) {
    if ($arabic >= 950) {
      if ($arabic >= 990) {
        if ($arabic == 999) {
          $roman .= 'im';
          $arabic -= 999;
        } else {
          $roman .= 'xm';
          $arabic -= 990;
        }
      } else {
        $roman .= 'lm';
        $arabic -= 950;
      }
    } else {
      $roman .= 'cm';
      $arabic -= 900;
    }
  } elsif ($arabic >= 500) {
    $roman .= 'd';
    $arabic -= 500;
  }
  while ($arabic >= 100) {
    $roman .= 'c';
    $arabic -= 100;
  }
  if ($arabic >= 90) {
    if ($arabic == 99) {
      $roman .= 'ic';
      $arabic -= 99;
    } elsif ($arabic == 95) {
      $roman .= 'vc';
      $arabic -= 95;
    } else {
      $roman .= 'xc';
      $arabic -= 90;
    }
  } elsif ($arabic >= 50) {
    $roman .= 'l';
    $arabic -= 50;
  }
  while ($arabic >= 10) {
    $roman .= 'x';
    $arabic -= 10;
  }
  if ($arabic == 9) {
    $roman .= 'ix';
    $arabic -= 9;
  } elsif ($arabic == 4) {
    $roman .= 'iv';
    $arabic -= 4;
  } elsif ($arabic >= 5) {
    $roman .= 'v';
    $arabic -= 5;
  }
  while ($arabic) {
    $roman .= 'i';
    $arabic -= 1;
  }
#  print "ROMAN is $roman\n";
  return $roman;
}

