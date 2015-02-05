package Meetup;

use strict;
use warnings;

use DateTime;

sub new {
	my ($class, $month, $year) = @_;
	my $date = DateTime->new(
						year  => $year,
						month => $month,
						day   => 1,
						);
	bless \$date, $class;
}

sub day {
	my ($self, $day, $cat) = @_;
	my $currentDate = ${$self};
	while ($currentDate->month eq $$self->month) {
		$currentDate->add(DateTime::Duration->new(days => 1));
		printf "[%2d: %2d] ", $$self->month, $$self->day;
		printf "[%2d: %2d]\n", $currentDate->month, $currentDate->day;
	}
}

my $time = Meetup->new(1, 2011);
$time->day("Tuesday", "teenth");

1;