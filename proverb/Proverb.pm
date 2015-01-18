package Proverb;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(proverb);
%EXPORT_TAGS = ( DEFAULT => [qw(&proverb)],
);

sub proverb {
	# Recites the proverb "for want of a nail"
	my ($causes, $qualifier) = @_;
	# Spaces are tricky
	my $root = ($qualifier ? "$qualifier " : "") . $causes->[0];
	my $phrases;
	for (0..scalar(@{$causes})-2) {
		$phrases .= "For want of a $causes->[$_] the $causes->[$_+1] was lost.\n";
	}
	return $phrases . "And all for the want of a $root.";
}

1;