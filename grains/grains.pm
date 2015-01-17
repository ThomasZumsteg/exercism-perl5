package Grains;

use strict;
use bigint;   #Solves overflow errors
use Exporter;
use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(square total);
%EXPORT_TAGS = ( DEFAULT => [qw(&square &total)],
);

sub square{
	# The number of grains on a chessboard square
	my $square = shift;
	return 2**($square-1);
}

sub total {
	# The total number of grains used
	return 2**64 - 1;
}

1;