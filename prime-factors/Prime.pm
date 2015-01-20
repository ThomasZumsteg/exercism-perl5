package Prime;

use strict;
use warnings;

sub factors {
	# Finds all prime factors of a number
	my $num = shift;
	my @factors;
	# Test all numbers up to sqrt($num)
	for my $factor (2..($num**0.5 + 1)) {
		while ($num % $factor == 0) {
			$num /= $factor;
			push @factors, $factor;
			last if $num == 1;
		}
	}
	# Catches single large factor
	push @factors, $num if $num != 1;
	return \@factors;
}

1;