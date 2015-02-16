package Sublist;

use strict;
use warnings;

use constant { TRUE => 1, FALSE => 0};

sub check_lists {
	# Checks if a list is contained in another
	my ($aList, $bList) = @_;
	my $switched = $#$aList > $#$bList ? TRUE : FALSE;
	my $contains = contains( $switched ? ($aList, $bList) : ($bList, $aList));
	return "equal" if $contains and $#$aList == $#$bList;
	return $switched ? "superlist" : "sublist" if $contains;
	return "unequal";
}

sub contains {
	# If a small list is in a larger list
	my ($superList, $subList) = @_;
	for (my $i = 0; $i <= $#$superList - $#$subList; $i++) {
		my $j = 0;
		$j++ until $#$subList < $j or $subList->[$j] ne $superList->[$i + $j];
		return TRUE if $#$subList < $j;
	}
	return FALSE;
}

1;