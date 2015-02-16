package LinkedList;

use strict;
use warnings;

sub new {
	# A singly linked list
	my $class = shift;
	bless { data => shift,
			next => @_ ? shift : undef,
		 }, $class;
}

# Encapsulation of data and next node
sub data { shift->{data} }
sub next { shift->{next} }

sub from_array {
	# Creates a linked list from an array
	my ($class, $array) = @_;
	# Recursive
	return $class->new(shift @$array, $class->from_array($array)) if @$array;
	# Root case
	return undef;
}

sub to_array {
	# Converts the linked list to an array
	my $self = shift;
	# Recursive
	return [$self->data, @{to_array($self->next)}] if $self->next;
	# Root case
	return [$self->data];
}

sub reverse {
	# Reverses the linked list
	my $self = shift;
	# Cheating?
	return ref($self)->from_array( [reverse @{$self->to_array}] );
}

1;