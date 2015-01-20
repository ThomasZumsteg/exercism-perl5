package Clock;

use strict;
use warnings;
use POSIX qw(floor);
use overload
	'+'  => \&addTime,
	'-'  => \&diffTime,
	'eq' => \&compTime,
	'""' => \&stringTime;

sub new {
	# Makes a clock with hours 0-23 and minutes between 0-59
	my ($class, $time) = @_;
	$time->[0] += floor(($time->[1] || 0) / 60);
	bless { hour => ($time->[0]) % 24,
			minute  => ($time->[1] || 0) % 60,
			}, $class;
}

sub addTime {
	# Adds time in minutes to a clock
	my ($clock, $time) = @_;
	return Clock->new([$clock->{hour},
					   $clock->{minute} + $time]);
}

sub diffTime {
	# Removes time in minutes from a clock
	my ($clock, $time) = @_;
	return $clock + (-$time);
}

sub compTime {
	# Compares two clocks (or strings)
	my ($clockA, $clockB) = @_;
	return "$clockA" eq "$clockB";
}

sub stringTime {
	# Prints a properly formated clock
	my $clock = shift;
	# Format is hh:mm for 0 <= hh < 24 and 0 <= mm < 60
	sprintf "%02d:%02d", $clock->{hour}, $clock->{minute}; 
}

1;