package Raindrops;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(convert);
%EXPORT_TAGS = ( DEFAULT => [qw(&convert)],
);

sub convert {
	my $num = shift;
	my $phrase;
	my %raindrops = (3 => "Pling", 5 => "Plang", 7 => "Plong");
	foreach my $drop (sort keys %raindrops) {
		$phrase .= $raindrops{$drop} if $num % $drop == 0;
	}
	return $phrase eq "" ? $num : $phrase;
}

1;