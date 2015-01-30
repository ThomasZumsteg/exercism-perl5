package Hexadecimal;

use warnings;
use strict;

sub new {
	my ($class, $number) = @_;
	bless \$number, $class;
}

sub to_decimal {
	# Converts a hexadecimal number to a decimal number
	# Iterates over the digits and sums result
	my @digits = reverse split //, lc ${shift()};
	my $val = 0;
	for (my $i = 0; $i <= $#digits; $i++) {
		my $d = $digits[$i];
		return 0 unless $d =~ m/[0-9a-f]/;
		$val += int($d) * 16**$i if $d =~ m/[0-9]/;
		$val += (ord($d) - ord('a') + 10) * 16**$i if $d =~ m/[a-f]/;
	}
	return $val;
}

1;