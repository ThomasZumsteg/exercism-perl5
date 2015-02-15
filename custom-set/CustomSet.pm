package CustomSet;

use strict;
use warnings;

use constant { TRUE => 1, FALSE => 0 };

sub new {
	# A set class
	my ($class, @items) = @_;
	my $self = bless [], $class;
	foreach my $item (@items) {
		$self->add($item) unless $self->is_member($item);
	}
	return $self;
}

sub is_member {
	# Tests if item is in set
	my ($self, $item) = @_;
	$_ eq $item and return TRUE foreach ($self->to_list);
	return FALSE;
}

sub add {
	# Adds item to set
	my ($self, $item) = @_;
	my $i = 0;
	$i++ until $#$self < $i or $item le $self->[$i];
	splice @$self, $i, 0, $item if $#$self < $i or $self->[$i] ne $item;
	return $self;
}

sub is_equal {
	# Test if two sets are equal
	my ($self, $set) = @_;
	return FALSE unless $set->size() == $self->size();
	$set->is_member($_) or return FALSE foreach ($self->to_list);
	return TRUE;
}

sub empty {
	# Removes all elements from a set
	my ($self) = @_;
	splice @$self, 0, $self->size;
	return $self;
}

sub delete {
	# Deletes an item from a set
	my ($self, $item) = @_;
	for (my $i = 0; $i <= $#$self; $i++ ) {
		splice @$self, $i, 1 if $self->[$i] eq $item;
	}
	return $self;
}

sub difference {
	# Items that are not in another set
	my ($self, $set) = @_;
	my $difference = ref($self)->new($self->to_list);
	$difference->delete($_) foreach ($set->to_list);
	return $difference;
}

sub is_disjoint {
	# Test if two elements have no items in common
	my ($self, $set) = @_;
	$self->is_member($_) and return FALSE foreach ($set->to_list);
	return TRUE;
}

sub intersect {
	# All item from two sets
	my ($self, $set) = @_;
	my $intersect = ref($self)->new();
	$set->is_member($_) and $intersect->add($_) foreach ( $self->to_list );
	return $intersect;
}

# Number of items in a set
sub size { $#{shift()} + 1 }

sub is_subset {
	# Tests if it contains all items in another set
	my ($self, $set) = @_;
	$self->is_member($_) or return FALSE foreach ($set->to_list);
	return TRUE;
}

sub union {
	# all items in both sets
	my ($self, $set) = @_;
	my $union = ref($self)->new();
	$union->add($_) foreach ($set->to_list, $self->to_list);
	return $union;
}

# A list of all items in the set
sub to_list { return @{shift()} }

1;