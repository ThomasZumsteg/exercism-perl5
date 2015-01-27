package Gigasecond;

use warnings;
use strict;

use DateTime;

sub new {
	# A new giga-date (HAS A date time object)
	my ($class, $year, $month, $day) = @_;
	my $self = DateTime->new(year => $year, month => $month, day => $day);
	bless \$self, $class;
}

# Add a gigasecond and format per test cases
sub date { return ${shift()}->add( seconds => 10**9)->strftime("%FT00:00:00") }

1;