package Cipher;

use strict;
use warnings;

sub new {
	# Create a shift key cipher
	my ($class, $key) = @_;
	$key = "a" unless defined $key;
	die "ArgumentError" unless $key =~ m/[a-z]+/;
	bless \$key, $class;
}

sub encode {
	# Encodes a string using the key
	my ($self, $text) = @_;
	$text =~ s/[^a-zA-Z]//g;
	my $cipherText = "";
	# Updates letter by letter
	for (my $i = 0; $i < length $text; $i++){
		my $letter = lc substr $text, $i, 1;
		my $key = substr $$self, $i % length $$self, 1;
		# Inelegant solution to ascii offset 
		$cipherText .= chr(((ord($letter) + ord($key) - 2 * ord('a')) % 26) + ord('a'));
	}
	return $cipherText;
}

sub decode {
	# Decodes the string using the key
	my ($self, $text) = @_;
	my $clearText = "";
	# Updates letter by letter
	for (my $i = 0; $i < length $text; $i++){
		my $letter = lc substr $text, $i, 1;
		my $key = substr $$self, $i % length $$self, 1;
		$clearText .= chr(((ord($letter) - ord($key)) % 26) + ord('a'));
	}
	return $clearText;
}

1;