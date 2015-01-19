package Decimal;

use strict;
use warnings;

sub new {
	# Converts decimal number to roman numerals
	my ($class, $num) = @_;
	bless \$num, $class;
}

# Roman decimal equivalents
my %digits = (	   1 =>  "I",   4 => "IV",   5 =>  "V",   9 => "IX",
				  10 =>  "X",  40 => "XL",  50 =>  "L",  90 => "XC",
				 100 =>  "C", 400 => "CD", 500 =>  "D", 900 => "CM",
				1000 =>  "M",
);

sub to_roman {
	# Converts decimal number to roman numerals
	my $remainer = ${shift()};
	my $roman;
	# The { $a <=> $b } forces sort by integer, not string
	# Basic greedy algorythm
	foreach my $value (reverse sort {$a <=> $b } keys %digits) {
		$roman .= $digits{$value} x int($remainer / $value);
		$remainer %= $value;
	}
	return $roman;
}

1;