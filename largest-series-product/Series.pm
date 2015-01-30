package Series;

use warnings;
use strict;

use List::Util qw/reduce/;

sub new {
	# Finds the largest product in a sequence of number
	my ($class, $number) = @_;
	bless \$number, $class;
}

sub slices {
	# Slices the number into chunks of digits
	my ($self, $sliceSize) = @_;
	my @slices;
	# Catches if the slice size is larget then the sequence
	die "ArgumentError" unless length($$self) >= $sliceSize;
	for (my $i = 0; $i <= length($$self) - $sliceSize; $i++) {
		push @slices, [split //, substr $$self, $i, $sliceSize];
	}
	return \@slices;
}

sub largest_product {
	# Finds the largest product of the digits
	my ($self, $sliceSize) = @_;
	# Smallest return value is 1
	my $largest = 1;
	foreach my $slice (@{$self->slices($sliceSize)}) {
		my $val = reduce {$a * $b} @$slice;
		# Catches case where $slice is []
		$largest = (defined $val and $largest < $val) ? $val : $largest;
	}
	return $largest;
}

1;