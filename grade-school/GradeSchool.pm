package GradeSchool;

use warnings;
use strict;

sub new {
	# A new grade school
	bless {}, shift;
}

sub add {
	# Add a student to a grade
	my ($self, $student, $grade) = @_;
	push @{$self->{$grade}}, $student;
	@{$self->{$grade}} = sort @{$self->{$grade}};
}

sub grade {
	# Returns a specific grade
	my ($self, $grade) = @_;
	return exists $self->{$grade} ? $self->{$grade} : [];
}


1;