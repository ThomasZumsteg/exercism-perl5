package Beer; # mmm beer

use strict;
use warnings;

sub verse {
	# Sings the beer song
	# Long form chosen for simplicity
	my $n = shift;
	if ($n == 0) {
		# Cathes "No more bottles" and rollover to 99
		return "No more bottles of beer on the wall, no more bottles of beer.\n" .
               "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
	}
	elsif ($n == 1) {
		# Catches bottles/bottle and "No more bottles"
		return "1 bottle of beer on the wall, 1 bottle of beer.\n" .
               "Take it down and pass it around, no more bottles of beer on the wall.\n";
	}
	elsif ($n == 2) {
		# Cathches bottles/bottle on second line
		return "2 bottles of beer on the wall, 2 bottles of beer.\n" .
               "Take one down and pass it around, 1 bottle of beer on the wall.\n";
	}
	else {
		# General case
		return "$n bottles of beer on the wall, $n bottles of beer.\n" .
			   "Take one down and pass it around, " . ($n - 1) . " bottles of beer on the wall.\n";
	}
}

sub sing {
	# Sings a range of verses
	my ($start, $stop) = (shift, shift || 0);
	my $song;
	for (my $i = $start; $i >= $stop; $i--) {
		$song .= &verse($i) . "\n";
	}
	return $song;
}

1;