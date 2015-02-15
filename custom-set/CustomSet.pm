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
	$_ eq $item and return TRUE foreach (@$self);
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
	$set->is_member($_) or return FALSE foreach (@$self);
	return TRUE;
}

sub empty {}

sub delete {
	my ($self, $item) = @_;
	for (my $i = 0; $i <= $#$self; $i++ ) {
		splice @$self, $i, 1 if $self->[$i] eq $item;
	}
	return $self;
}

sub difference {}

sub is_disjoint {}

sub intersect {}

sub size { $#{shift()} + 1 }

sub is_subset {
	my ($self, $anotherSet) = @_;
	$self->[$_] == $anotherSet->[$_] or return FALSE foreach (0..$#$self);
}

sub to_list { [ @{shift()} ] }

sub union {
	my ($self, $set) = @_;
	$self->add($_) foreach (@$set);
	return $self;
}

# my $setA = CustomSet->new(1..3)->add(3);
# my $setB = CustomSet->new(1,2,3);
# print "@{$setA->to_list}\n@{$setB->to_list}\n";
# print "Test\n" if CustomSet->new(1,2,3)->is_equal(CustomSet->new());

1;