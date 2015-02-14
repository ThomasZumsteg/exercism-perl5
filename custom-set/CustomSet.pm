package CustomSet;

use strict;
use warnings;

use constant { TRUE => 1, FALSE => 0};

sub new {
	my $self = bless [], shift;
	$self->is_member($_) or $self->add($_) foreach (@_);
	return $self;
}

sub is_member {
	my ($self, $item) = @_;
	print "Checking membership $item\n";
	$_ eq $item and return TRUE foreach (@$self);
	print "nope\n";
	return FALSE;
}

sub add {
	my ($self, $item) = @_;
	my $i = 0;
	print "Adding $item\n";
	for ( ; $i <= $#$self and $self->[$i] lt $item; $i++) {
		return if $self->[$i] eq $item;
	}
	print "Added $item at $i\n";
	splice @$self, $i, 0, $item;
}

sub is_equal {
	my ($self, $anotherSet) = @_;
	$self->[$_] == $anotherSet->[$_] or return FALSE foreach (0..$#$self);
	return $#$self == $#$anotherSet;
}

sub empty {

}

sub delete {}

sub difference {}

sub is_disjoint {}

sub intersect {}

sub size {}

sub is_subset {
	my ($self, $anotherSet) = @_;
	$self->[$_] == $anotherSet->[$_] or return FALSE foreach (0..$#$self);
}

sub to_list { [@{shift()}] }

sub union {}

my $set = CustomSet->new((1..10));
print "@$set\n";

1;