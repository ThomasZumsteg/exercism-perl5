package Accumulate;

use strict;
use warnings;

sub accumulate {
	# Applies a function to every item in a list
	my ($list, $function) = @_;
	my $new_list = [];
	foreach my $item (@$list) {
		push $new_list, &$function($item);
	}
	return $new_list;
}

1;