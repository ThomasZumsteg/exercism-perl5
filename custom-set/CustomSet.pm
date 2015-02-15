package CustomSet;

use strict;
use warnings;

use constant { TRUE => 1, FALSE => 0 };

sub new {
	my ($class, @items) = @_;
	my $self = bless [], $class;
	foreach my $item (@items) {
		$self->add($item) unless $self->is_member($item);
	}
	return $self;
}

sub is_member {
	my ($self, $item) = @_;
	$_ eq $item and return TRUE foreach ($self->to_list);
	return FALSE;
}

sub add {
	my ($self, $item) = @_;
	my $i = 0;
	$i++ until $#$self < $i or $item le $self->[$i];
	splice @$self, $i, 0, $item if $#$self < $i or $self->[$i] ne $item;
	return $self;
}

sub is_equal {
	my ($self, $set) = @_;
	return FALSE unless $set->size() == $self->size();
	$set->is_member($_) or return FALSE foreach ($self->to_list);
	return TRUE;
}

sub empty {
	my ($self) = @_;
	splice @$self, 0, $self->size;
	return $self;
}

sub delete {
	my ($self, $item) = @_;
	for (my $i = 0; $i <= $#$self; $i++ ) {
		splice @$self, $i, 1 if $self->[$i] eq $item;
	}
	return $self;
}

sub difference {
	my ($self, $set) = @_;
	my $difference = ref($self)->new($self->to_list);
	$difference->delete($_) foreach ($set->to_list);
	return $difference;
}

sub is_disjoint {
	my ($self, $set) = @_;
	$self->is_member($_) and return FALSE foreach ($set->to_list);
	return TRUE;
}

sub intersect {
	my ($self, $set) = @_;
	my $intersect = ref($self)->new();
	foreach my $item ( $self->to_list, $set->to_list ) {
		$intersect->add($item) if $self->is_member($item) and $set->is_member($item);
	}
	return $intersect;
}

sub size { $#{shift()} + 1 }

sub is_subset {
	my ($self, $set) = @_;
	$self->is_member($_) or return FALSE foreach ($set->to_list);
	return TRUE;
}

sub union {
	my ($self, $set) = @_;
	my $union = ref($self)->new();
	$union->add($_) foreach ($set->to_list, $self->to_list);
	return $union;
}

sub to_list { return @{shift()} }

1;