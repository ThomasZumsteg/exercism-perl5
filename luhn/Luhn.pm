package Luhn;

use strict;
use warnings;

use List::Util qw(sum);

sub new {
	# Creates a new luhn class
	my ($class, $num) = @_;
	bless \$num, $class;
}

sub addends {
	# Doubles every second digits from the left,
	# subtracts 9 if over 10
	my @digits = split //, ${shift()};
	for (my $i = $#digits - 1; $i >= 0; $i -= 2) {
		my $digit = 2 * $digits[$i];
		$digits[$i] = $digit >= 10 ? $digit - 9 : $digit;
	}
	return \@digits;
}

# Sum of a Luhn number
sub checksum { return sum @{shift()->addends()} }

# Checks if the number is a valid Luhn
sub is_valid { return (shift()->checksum() % 10 == 0) }

sub create {
	# Creates a Luhn number by adding the check digit
	my $num = ${shift()} * 10;
	# Negative modulus
	return $num + (- Luhn->new($num)->checksum() % 10);
}

1;