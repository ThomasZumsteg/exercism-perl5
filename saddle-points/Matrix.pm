package Matrix;

use strict;
use warnings;

use List::Util qw/max min/;

sub new {
	# Finds saddle points in a matrix
	my ($class, $matrixLines) = @_;
	my @matrix = map {$_ = [split " ", $_]} split "\n", $matrixLines;
	bless \@matrix, $class;
}

sub rows {
	# A row of the matrix
	my ($self, $rowNum) = @_;
	return $self->[$rowNum];
}

sub columns {
	# A column of the matrix
	my ($self, $colNum) = @_;
	return [map { $self->[$_]->[$colNum] } (0..$#$self)];
}

sub saddle_points {
	# Finds all points that are the biggest in there row and smallest in there column
	my $self = shift;
	my @saddlePoints;
	foreach my $rowNum (0..$#$self) {
		foreach my $colNum (0..$#{$self->[$rowNum]}) {
			next unless $self->[$rowNum]->[$colNum] == min @{$self->columns($colNum)};
			next unless $self->[$rowNum]->[$colNum] == max @{$self->rows($rowNum)};
			push @saddlePoints, [$rowNum, $colNum];
		}
	}
	return \@saddlePoints;
}

1;