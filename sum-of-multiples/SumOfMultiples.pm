package SumOfMultiples;

use strict;
use warnings;

sub new {
	# A set of factors
	my ($class, @nums) = @_;
	# Default
	@nums = (3, 5) unless @nums;
	bless \@nums, $class;
}

sub to {
	# Sum of all numbers that are multiples of a least of one a set of factors
	# up to but not including the given number
	my ($self, $stop) = @_;
	my $total = 0;
	foreach my $num (1..($stop-1)) {
		$total += $num if $self->isMultiple($num);
	}
	return $total;
}

sub isMultiple {
	# Tests if one number is a multiple of at least one of a set of factors
	my ($self, $num) = @_;
	foreach my $divisior (@$self) {
		return 1 if $num % $divisior == 0;
	}
	return 0;
}

1;