package Triangle;

use strict;
use warnings;

sub kind {
	# Determines the type of triangle
	my ($a, $b, $c) = @_;
	# Catches zero length sides and impossible triangles
	die "TriangleError" if ($a <= 0 or $b <= 0 or $c <= 0);
	die "TriangleError" if ($a + $b <= $c or $b + $c <= $a or $a + $c <= $b);
	# Triangle types
	return "equilateral" if $a == $b and $b == $c;
	return "isosceles" if $a == $b or $b == $c or $a == $c;
	return "scalene";
}

1;