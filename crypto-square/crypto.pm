package Crypto;

use strict;
use warnings;

sub new {
	# Creates a crpyto square
	my ($class, $text) = @_;
	bless {text => $text}, $class;
}

sub normalize_plaintext {
	# Lowers the text and cleans of all non digits and letters 
	my $self = shift;
	($self->{plaintext} = lc $self->{text}) =~ s/[^0-9a-z]//g;
	return $self->{plaintext};
}

sub size {
	# Size of the square
	my $self = shift;
	# Requires the plain text
	$self->normalize_plaintext() unless exists $self->{plaintext};
	# The smallest square integer larger then or equal the number of digits
	# ie f(3) = 2: 2**2 >= 3, f(14) = 4: 4**2 >= 14, f(9) = 3: 3**2>=9
	$self->{size} = int( (length( $self->{plaintext} ) - 1)**0.5) + 1;
	return $self->{size};
}

sub plaintext_segments {
	# Segments plaintext into chunks the size of the square or less
	my $self = shift;
	# Requires size
	$self->size() unless exists $self->{size};
	# Selects substrings
	for (my $i = 0; $i < length $self->{plaintext}; $i += $self->{size}) {
		push @{$self->{segments}}, substr $self->{plaintext}, $i, $self->{size};
	}
	return $self->{segments};
}

sub ciphertext {
	# Ciphers the text by reading characters top to bottom, left to right
	my $self = shift;
	# Requires segments
	$self->plaintext_segments() unless exists $self->{segments};
	for (my $i = 0; $i < $self->{size}; $i++) {
		for (my $j = 0; $j < scalar @{$self->{segments}}; $j++) {
			# Skips if character does not exist
			if ($i <= length $self->{segments}[$j]) {
				$self->{ciphertext} .= substr $self->{segments}[$j], $i, 1;
			}
		}
	}
	return $self->{ciphertext};
}

sub normalize_ciphertext {
	my $self = shift;
	$self->ciphertext() unless exists $self->{ciphertext};
	$self->size() unless exists $self->{size};
	(my $normCiphertext = $self->{ciphertext}) =~ s/(.{$self->{size}})/$1 /g;
	$normCiphertext =~ s/ $//;
	return $normCiphertext;
}

1;