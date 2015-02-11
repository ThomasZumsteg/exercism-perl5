package Triplet;

use strict;
use warnings;

use List::Util;
use List::MoreUtils qw/uniq/;

sub new {
	# New pythagorean triplet finder
	my ($class) = shift;

	# Seperates triplet (set of 3 numbers) from triplet finder (hash ref)
	return bless shift, $class if ref $_[0] eq 'HASH';
	bless \@_, $class;
}

sub is_pythagorean {
	# Tests if three number are a triplet
	my ($a, $b, $c) = sort { int $a <=> int $b } @{shift()};
	return $a**2 + $b**2 == $c**2;
}

# Sum of the elements 
sub sum { return List::Util::sum @{shift()} }

# Product of the elements
sub product { return List::Util::product @{shift()} }

sub products {
	# Finds triplets with certain characteristics
	my $self = shift;

	# Default values for finding loop
	my $max = $self->{max_factor} // die "ArgumentError";
	my $min = $self->{min_factor} // 1;
	my $sum = $self->{sum} // undef;

	# Finds triplets by trying all of them
	my @triplets;
	foreach my $a ($min..$max) {
		foreach my $b ($a..$max) {
			foreach my $c ($b..$max) {
				my $test = Triplet->new($a, $b, $c);
				next if $sum and $sum != $test->sum;
				next unless $test->is_pythagorean;
				push @triplets, $test->product;
			}
		}
	}
	# Return on the unique products
	return [uniq @triplets];
}

1;