package Sieve;

use warnings;
use strict;

# Standin for true/false
use constant {
	PRIME => 1,
	NOT_PRIME => 0,
};

sub new {
	# Creates a prime sieve
	my ($class, $limit) = @_;
	my @self = (PRIME) x $limit;
	bless \@self, $class;
}

sub primes {
	# Sieves primes
	my $self = shift;
	my @primes;
	# Test all numbers
	for my $num (2..$#$self) {
		next unless $self->[$num] == PRIME;
		push @primes, $num;
		# Mark new primes
		for (my $multiple = $num**2; $multiple <= $#$self; $multiple += $num ) {
			$self->[$multiple] = NOT_PRIME;
		}
	}
	return \@primes;
}

1;