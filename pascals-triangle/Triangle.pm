package Triangle;

use strict;
use warnings;

use List::Util qw/reduce/;

sub triangle {
	# The first n rows of Pascals Triangle
	my $numRows = shift;
	return [map {row($_)} (0..$numRows)];
}

sub is_triangle {
	# Checks if a triangle is Pascals Triangle
	my $triangle = shift;
	# Checks each row
	foreach my $i (0..$#$triangle) {
		return 0 unless $triangle->[$i] eq row($i);
	}
	return 1;
}

sub row {
	# A row of pascals triangle
	my $rowNum = shift;
	join " ", map {binomial($rowNum, $_)} (0..$rowNum);
}

sub binomial {
	# Find Binomial coefficient
	my ($n, $k) = @_;
	die "$n must be larger or equal $k" if $k > $n;
	return 1 if $k == 0 or $k == $n; # Zero problem in multiplication formula
	# http://en.wikipedia.org/wiki/Binomial_coefficient#Multiplicative_formula
	return reduce {$a * $b} map {($n + 1 - $_) / $_} (1..$k);
}

1;