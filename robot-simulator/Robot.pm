package Robot;

use strict;
use warnings;

use List::Util qw/first/;

sub new {
	my $class = shift;
	bless { names => [qw/north east south west/],
		  vectors => [ [0,1], [1,0], [0,-1], [-1,0] ],
	  bearingName => undef,
		  bearing => undef,
		     move => undef,
		 position => undef,
		  }, $class;
}

sub orient {
	# Set the direction the robot is facing
	my ($self, $bearing) = @_;
	my $bearingNum = first {$self->{names}->[$_] eq $bearing} 0..$#{$self->{names}};
	die "ArgumentError" unless defined $bearingNum;
	$self->{bearing} = $bearingNum;
	$self->{bearingName} = $bearing;
	$self->{move} = $self->{vectors}->[$bearingNum];
}

# The direction the robot is facing
sub bearing { shift->{bearingName} }

sub turn_right {
	# Change orientation 90 degrees clockwise
	my $self = shift;
	my ($names, $bearing) = map { $self->{$_} } qw/names bearing/;
	$self->orient( $names->[($bearing + 1) % 4] );
}

sub turn_left {
	# Change orientation 90 degrees anti-clockwise
	my $self = shift;
	my ($names, $bearing) = map { $self->{$_} } qw/names bearing/;
	$self->orient( $names->[($bearing - 1) % 4] );
}

sub at {
	# Set the x y position of the robot
	my ($self, $x, $y) = @_;
	$self->{position} = [$x, $y];
}

# The current position of the robot
sub coordinates { shift->{position} }

sub advance { 
	# Move the robot
	my $self = shift;
	my ($position, $move) = (\$self->{position}, $self->{move});
	$$position = [map {$move->[$_] + $$position->[$_]} (0..$#$$position)];
}

package Simulator;

# A simulator to give multiple instructions to a robot
sub new { bless { L => 'turn_left', R => 'turn_right', A => 'advance' }, shift}

sub instructions {
	# Splits a string into robot instructions
	my ($self, $instructionList) = @_;
	return [map { $self->{$_} } split //, $instructionList];
}

sub place {
	# Initilizes a robot
	my ($self, $robot, $args) = @_;
	my ($x, $y, $bearing) = map { $args->{$_} } qw/x y direction/;
	$robot->at($x, $y);
	$robot->orient($bearing);
}

sub evaluate {
	# Runs a string of instructions on a robot
	my ($self, $robot, $list) = @_;
	no strict 'refs';
	$robot->$_ foreach (@{$self->instructions($list)});
}

1;