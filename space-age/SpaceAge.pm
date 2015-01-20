package SpaceAge;

use strict;
use warnings;
no warnings 'once'; # Quashes the "only used once" warnings

sub new{
	# Age of a person in seconds
	my ($class, $seconds) = @_;
	bless \$seconds, $class;
}

# The number of seconds a the person has been alive
sub seconds { return ${shift()}; }

sub on_any {
	# Makes functions that convert seconds to some ratio of earth years
	my $ratio = shift;
	return sub {
		# Anon function that can be configured to return some ratio of earth years
		# Round to 2 decimal places
		return sprintf "%.2f", ${shift()} / (31557600 * $ratio);
	}
}

# Functions that return the number of years on that planet
*on_mercury = on_any(0.2408467);
*on_venus	= on_any(0.61519726);
*on_earth   = on_any(1);
*on_mars	= on_any(1.8808158); 
*on_jupiter	= on_any(11.862615);
*on_saturn	= on_any(29.447498);
*on_uranus	= on_any(84.016846);
*on_neptune	= on_any(164.79132); 

1;