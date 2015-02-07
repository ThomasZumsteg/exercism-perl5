package Palindrome;

use strict;
use warnings;

use List::Util qw(min max);

sub new {
	# Finds palindrome numbers within a certain range
	my ($class, $args) = @_;
	my %products;
	foreach my $i (($args->{min_factor} ? $args->{min_factor} : 1)..$args->{max_factor}) {
		foreach my $j ($i..$args->{max_factor}) {
			my $product = $i * $j;
			push @{$products{$product}}, [$i, $j] if isPalindrome($product);
		}
	}
	bless \%products, $class;
}

sub isPalindrome {
	# Test if a string is a palindrome
	my $string = shift;
	my $reversedString = join '', reverse split //, $string;
	return $string eq $reversedString;
}

sub largest {
	# The largest palindrome number and factors
	my $self = shift;
	my $largest = max keys %$self;
	return {value => $largest, factors => $self->{$largest}};
}

sub smallest {
	# The smallest palindrome number and factors
	my $self = shift;
	my $smallest = min %$self;
	return {value => $smallest, factors => $self->{$smallest}};	
}

1;