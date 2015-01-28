package Strain;

use strict;
use warnings;

sub keep {
	# Items to keep
	my ($items, $function) = @_;
	my @keep;
	$function->($_) and push @keep, $_  foreach @$items;
	return \@keep;
}

sub discard {
	# Items to discard
	my ($items, $function) = @_;
	# Inverts the function and runs keep
	return keep $items, sub { not $function->(shift) };
}

1;