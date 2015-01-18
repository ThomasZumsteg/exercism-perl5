package Phrase;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(word_count);
%EXPORT_TAGS = ( DEFAULT => [qw(&word_count)],
);

sub word_count {
	# Counts all words in a phrase
	my $phrase = shift;
	my $word_count;
	foreach (split m/ /, $phrase) {
		s/[\W]//g;
		$word_count->{lc $_} += 1 if $_;
	}
	return $word_count;
}

1;