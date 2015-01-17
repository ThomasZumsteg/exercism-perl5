package Bob;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
use utf8;

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(hey);
%EXPORT_TAGS = ( DEFAULT => [qw(&hey)],
);

sub hey {
	# Reponses like a teenager
	my ($phrase) = @_;
	$phrase =~ s/^\s+//g;
	if($phrase =~ /\p{Uppercase}/ and $phrase !~ /\p{Lowercase}/) {
		# Shouting has at least one uppercase and no lower case
		return 'Whoa, chill out!';
	} elsif($phrase eq "") {
		# Empty has only whitespace characters
		return 'Fine. Be that way!';
	} elsif(substr($phrase, -1) eq '?') {
		# Questions end with a ?
		return 'Sure.';
	} else {
		# Everything else
		return 'Whatever.';
	}
}

1;
