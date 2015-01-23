package Cipher;

use strict;
use warnings;

sub encode {
	# Runs the cipher agains the input and creates groups of 5 characters
	my $text = join '', map { cipher($_) } split '', shift();
	$text =~ s/(.{5})/$1 /g;
	# Removes trailing space
	$text =~ s/ $//;
	return $text;
}

sub decode {
	# Runs the cipher agains the input
	return join '', map { cipher($_) } split '', shift;
}

sub cipher {
	# Cipher rules for each letter 
 	$_ = shift;
 	# Just return digits
 	return $_ if m/[0-9]/;
 	# Flips and lowers letters (ie a -> z, N -> m)
 	return chr(25 - ord(lc $_) + 2 * ord('a')) if m/[a-z]/i;
 	# other wise drop it
 	return '';
}

1;