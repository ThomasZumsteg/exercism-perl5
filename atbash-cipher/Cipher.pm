package Cipher;

use strict;
use warnings;

sub encode {
	my $text = join '', map { cipher($_) } split '', shift();
	$text =~ s/(.{5})/$1 /g;
	$text =~ s/ $//;
	return $text;
}

sub decode {
	return join '', map { cipher($_) } split '', shift;
}

sub cipher {
 	$_ = shift;
 	return $_ if m/[0-9]/;
 	return chr(25 - ord(lc $_) + 2 * ord('a')) if m/[a-z]/i;
 	return '';
}

1;