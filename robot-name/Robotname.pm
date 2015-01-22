package RobotName;

use strict;
use warnings;

sub new{
	# Make a new RobotName
	my $class = shift;
	my $number = makeName();
	bless \$number, $class;
}

# Seed for robot names
my $nRobots = 0;

sub makeName {
	# Make a name for a robot like RD523
	# Uses the $nRobots seed
	my $number = $nRobots++;
	my $name = sprintf "%03d", $number % 1000;
	$number = int($number / 1000);
	$name = chr($number % 26 + ord('A')) . $name;
	$number = int($number / 26);
	return chr($number % 26 + ord('A')) . $name;
}

# The robots name
sub name { return ${shift()}; }

# Change the robots name
sub reset_name { ${shift()} = makeName(); }

1;