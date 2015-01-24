package Trinary;

use strict;
use warnings;

sub new {
	# New trinary number
	my ($class, $number) = @_;
	bless \$number, $class;
}

sub to_decimal {
	# Base 10 representation of a base 3 number
	my $number = ${shift()};
	my $decimal = 0;
	for(my $i = 1; $i <= length $number; $i++) {
		# Select the digits in reverse order
		my $digit = substr $number, -$i, 1;
		# Return 0 if not trinary
		return 0 unless $digit =~ m/[012]/;
		$decimal += $digit * 3**($i-1);
	}
	return $decimal;
}

1;