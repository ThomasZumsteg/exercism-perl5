package ETL;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(transform);
%EXPORT_TAGS = ( DEFAULT => [qw(&transform)],
);

sub transform {
	# Swaps key/values in old hash to create new hash
	my $old = shift;
	my $new;
	while (my($key, $values) = each %$old) {
		foreach my $val (@$values) {
			$new->{lc $val} = $key;
		}
	}
	return $new;
}

1;