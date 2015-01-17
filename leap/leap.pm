package Leap;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(is_leap);
%EXPORT_TAGS = ( DEFAULT => [qw(&is_leap)],
);

sub is_leap {
	# Tests if a year is a leap year
	my $year = shift;

	return (($year % 4 == 0) and 
			($year % 100 != 0 or $year % 400 == 0));
}