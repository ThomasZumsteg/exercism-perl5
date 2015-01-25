package Allergies;

use strict;
use warnings;
use List::Util qw(first);

my @allergies = ( "eggs", "peanuts", "shellfish", "strawberries", 
				  "tomatoes", "chocolate", "pollen", "cats");

sub new {
	# Class for keeping track of allergies
	my ($class, $value) = @_;
	bless \$value, $class;
}

sub list {
	# List of allergic items
	my $self = shift;
	my @items;
	# Checks each bit and adds the corresponding index to @items
	for (my $i = 0; $i <= $#allergies; $i++ ){
		push @items, $allergies[$i] if $$self & (1 << $i);
	}
	return \@items;
}

sub allergic_to {
	# Is allergic to a give item
	my ($self, $item) = @_;
	# Index of the allergy
	my $mask = first { $allergies[$_] eq $item } 0..$#allergies;
	# Returns -1 if the allergy isn't found, otherwise tests the bit 
	return (not defined $mask) ? -1 : ($$self & 1 << $mask) ? 1 : 0;
}

1;