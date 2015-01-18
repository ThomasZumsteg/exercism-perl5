package Anagram;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

# Test if arrays are equal
use Test::Deep qw( eq_deeply );

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(match);
%EXPORT_TAGS = ( DEFAULT => [qw(&match)],
);

sub match {
	# Finds anagrams of a word in a list
	my ($word, @words_to_check) = @_;
	# Sorting strings isn't allowed
	my $letters = [sort split //, lc $word];
	my $matches = [];
	foreach (@words_to_check) {
		my $anagram = [sort split //, lc];
		# Comparing arrays is difficult (could use ~~)
		push @$matches, $_ if eq_deeply($anagram, $letters) and $word ne $_;
	}
	return $matches;
}

1;