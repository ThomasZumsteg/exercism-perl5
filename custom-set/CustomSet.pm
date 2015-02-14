package CustomSet;

use strict;
use warnings;

use constant { TRUE => 1, FALSE => 0};

sub new {
	my ($class, @items) = @_;
	bless [sort @items], $class;
}

sub is_equal {
	my ($self, $anotherSet) = @_;
	$self->[$_] == $anotherSet->[$_] or return FALSE foreach (0..$#$self);
	return $#$self == $#$anotherSet;
}

sub add {
	my ($self, $item) = @_;
	
}

sub empty {

}

sub delete {}

sub difference {}

sub is_disjoint {}

sub intersect {}

sub is_member {
	my ($self, $item) = @_;
	$_ == $item and return TRUE foreach (@$self);
	return FALSE;
}

sub size {}

sub is_subset {
	my ($self, $anotherSet) = @_;
	$self->[$_] == $anotherSet->[$_] or return FALSE foreach (0..$#$self);
}

sub to_list { [@{shift()}] }

sub union {}

1;