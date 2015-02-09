package BinarySearchTree;

use strict;
use warnings;

sub new {
	# A binary tree node
	my ($class, $data) = @_;
	bless { data => $data,
			left => undef,
			right => undef,
		  }, $class;
}

# Ecapsulation of object data
sub left { return shift->{left}}
sub right { return shift->{right}}
sub data { return shift->{data}}

sub insert {
	# Insert a new node
	my ($self, $newData) = @_;
	# Pick direction
	my $node = ($self->data >= $newData) ? \$self->{left} : \$self->{right};
	# If there's already a node there, insert on that node, else new node
	defined $$node ? $$node->insert($newData) : ($$node = ref($self)->new($newData));
}

sub each {
	# Apply a function to each node's data from smallest to largest
	my ($self, $sub)  = @_;
	$self->left->each($sub) if defined $self->left;
	$sub->($self->data);
	$self->right->each($sub) if defined $self->right;
}

1;