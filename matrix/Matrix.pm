package Matrix;

use strict;
use warnings;

sub new {
	# Create a 2d matrix
	my ($class, $matrixString) = @_;
	my @matrix = map {[split " "]} split "\n", $matrixString;
	bless \@matrix, $class;
}

sub rows {
	# A row of a 2d matrix
	my ($self, $row) = @_;
	return $self->[$row];
}

sub columns {
	# A column of a 2d matrix
	my ($self, $col) = @_;
	return [map {$self->[$_][$col]} (0..$#$self)];
}

1;