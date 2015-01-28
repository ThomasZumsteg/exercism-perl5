package PigLatin;

use strict;
use warnings;

sub translate {
	# Translates a phrase into piglatin
	return join ' ', map { &translateWord($_) } split ' ', shift;
}

sub translateWord {
	# Translate one word into piglatin
	$_ = shift;
	# Handles qu problem 
	return "$2$1ay" if m/(.*?[^q])(u.*)/;
	# Handles when y is not a vowle
	return $_ . "ay" if m/^y[^aeiou]/;
	# Default handler
	if (m/(.*?)([aeoi].*)/) {
		# Catches if the word is equal to itself
		return $_ . "ay" if "$1ay" eq $_;
		# Default return
		return "$2$1ay";
	}
	# Probably not a word
	return $_;
}

1;