package Phone;

use warnings;
use strict;

sub new {
	# Creates a 10 digit phone number if it exists
	# ten zeros otherwise
	my ($class, $arg) = @_;
	# Remove all non-number for easier matching
	$arg =~ s/\D//g;
	# Must be ten digits with an optional leading 1
	if ($arg !~ m/^1?(?<phonenumber>\d{10})$/) {
		$arg = "0" x 10;
	} else {
		$arg = $+{phonenumber};
	}
	bless \$arg, $class;
}

# The cleaned phonenumber
sub number { ${shift()}; }

# The area code
sub area_code { substr(${shift()}, 0, 3); }

# The phone number as (xxx) xxx-xxxx
sub pretty {
	my $num = ${shift()};
	return sprintf "(%3s) %3s-%4s", 
		substr($num, 0, 3), substr( $num, 3, 3), substr($num, 6, 4);
}

1;