#!/usr/bin/perl
use strict;
use warnings;

# speed is defined as distance divided by the time taken
# the time is measured in seconds; we want to express the
# speed in miles per hour, the distance is 1 mile.

# We need to compute distance/(time_in_seconds/seconds_per_hour)

# Since the distance is always 1, this is equivalent to 
# speed = (seconds_per_hour/time_in_seconds)

use constant SECONDS_PER_HOUR => 3600;

my $lower = 40;
my $upper = 70;

for (my $time = $lower; $time <= $upper; $time++) {
  print "TIME - $time\tSPEED - ",sprintf("%0.2f", SECONDS_PER_HOUR/$time),"\n";
}
