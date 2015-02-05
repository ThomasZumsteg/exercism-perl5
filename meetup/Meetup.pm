package Meetup;

use strict;
use warnings;

use DateTime;

sub new {
	# Finds a meetup date
	my ($class, $month, $year) = @_;
	my $date = DateTime->new( year  => $year, month => $month );
	bless \$date, $class;
}

# Tests to determine if date matches catagory
my %catagory = ("teenth" => sub { my $date = shift; 13 <= $date->day and $date->day <= 19},
				"first" => sub {my $date = shift; $date->day <= 7},
				"second" => sub {my $date = shift; 7 < $date->day and $date->day <= 14},
				"third" => sub {my $date = shift; 14 < $date->day and $date->day <= 21},
				"fourth" => sub {my $date = shift; 21 < $date->day and $date->day <= 28},
				"last" => sub {my $date = shift; $date->clone()->add(days => 7)->month != $date->month},
			   );

sub day {
	# Finds a date on a day of a particular type (first, last, teenth)
	my ($self, $day, $cat) = @_;
	# Go over the whole month, skip days that aren't the correct weekday
	# return the one that matches the catagory
	for (my $date = $$self->clone(); $date->month == $$self->month; $date->add( days => 1)) {
		next unless lc $day eq lc $date->day_name();
		return $date if $catagory{lc $cat}->($date);
	}
}

1;