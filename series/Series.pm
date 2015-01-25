package Series;

use strict;
use warnings;

sub new {
	# Slices a number into sub numbers
	my ($class, $number) = @_;
	bless \$number, $class;
}

sub slice {
	# Slices a number in slices of a certain size
	my ($self, $sliceSize) = @_;
	die "ArgumentError" unless $sliceSize <= length $$self;
	my $slices = [];
	for (my $i = 0; $i <= ((length $$self) - $sliceSize); $i++) {
		my @slice = split //, substr $$self, $i, $sliceSize;
		push @$slices, @slice;
	}
	return $slices;
}

1;