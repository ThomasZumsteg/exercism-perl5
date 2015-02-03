package BinarySearch;

use strict;
use warnings;

sub binary_search {
	# A binary search algorythm
	my ($searchItem, @items) = (shift, @{shift()});
	my ($iMin, $iMax) = (0, $#items);
	while ($iMin <= $iMax) {
		my $iAvg = int(($iMax + $iMin) / 2);
		die "Items must be sorted" if ($items[$iMin] gt $items[$iMax]);
		return $iAvg if $items[$iAvg] eq $searchItem;
		$items[$iAvg] gt $searchItem ? ($iMax = $iAvg - 1) : ($iMin = $iAvg + 1);
	}
	return undef;
}

1;