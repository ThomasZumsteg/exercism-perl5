package Hamming;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(convert);
%EXPORT_TAGS = ( DEFAULT => [qw(&convert)],
);

sub compute {
	# Determines the hamming distance between two dna strands
	my ($dnaA, $dnaB) = @_;
	my $distance = 0;
	# (0..(shortest strand))
	for my $i (0..(length($dnaA) > length($dnaB) ? length($dnaB) : length($dnaA)) - 1) {
		$distance++ if(substr($dnaA, $i, 1) ne substr($dnaB, $i, 1));
	}
	return $distance;
}

1;