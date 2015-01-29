package ListOps;

use warnings;
use strict;

sub map {
	# Executes a function on every element of a list
	my ($func, @list) = (shift, @{shift()});
	$list[$_] = $func->($list[$_]) foreach (0..$#list);
	return \@list;
}

sub reduce {
	# Uses a function to combine every element of a list
	my ($func, $list) = @_;
	my $sum = shift( @$list );
	$sum = $func->($sum, $_) foreach @$list;
	return $sum;
}

# The length of a list
# Might be cheating...
sub length { return scalar @{shift()} }

1;