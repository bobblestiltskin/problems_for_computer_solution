#!/usr/bin/perl
use strict;
use warnings;

# the text seems to miss the point that the golden ratio is what
# term[n+1]/term[n] tends towards?

use constant GOLDEN_RATIO => 1.618;

my @numbers = (0, 1);
for (my $count = 0; $count < 10; $count++) {
  my $this = $numbers[-1] + $numbers[-2];
  push @numbers, $this;
  my $product = sprintf("%0.2f", $this * GOLDEN_RATIO);
  my $next = $numbers[-1] + $numbers[-2];
  print "$this x ",GOLDEN_RATIO," = ",$product," = ";
  if ($next > $product) {
    print $next, " - ", sprintf("%0.2f", $next - $product);
  } else {
    print $next, " + ", sprintf("%0.2f", $product - $next);
  }
  print " or ",sprintf("%0.4f", $next/$this),"\n";
}
