package Squares;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(new square_of_sums sum_of_squares difference);
%EXPORT_TAGS = ( DEFAULT => [qw(&new &square_of_sums &sum_of_squares &difference)],
);

# Sequence substitutions are derived from 
# sum( f(k), 0, n) = sum( f(k+1), 0, n) - f(n+1)
# where f(k) is usually k**(n+1) to find sum(k**n)
# note: f(0) must be 0
# e.g.
# sum( k**2, 0, n) = sum((k + 1)**2, 0, n) - (n + 1)**2
#  				   = sum(k**2 + 2*k + 1) - (n + 1)**2
# 				   = sum(k**2) + 2*sum(k) + sum(1) - (n + 1)**2
# 				   = sum(k**2) + 2*sum(k) + (n + 1) - (n + 1)**2	[sum(1, 0, n) = n + 1]
# 	      2*sum(k) = (n + 1)**2 - (n + 1)
# 				   = n**2 + 2*n + 1 - n - 1
# 				   = n**2 + n
# 		    sum(k) = (n + 1) * n / 2								[Triangle numbers]
# 	     sum(k)**2 = (n + 1)**2 * n**2 / 4

# sum(k**2) is left as an exercise to the reader.

sub new {
	my $class = shift;
	my ($num) = @_;
	return bless { 
		num => $num,
		}, $class;
}

sub square_of_sums{
	# Square of the sum of all natural numbers 0..$num
	my $this = shift;
	my $num = $this->{num};
	return $num**2 * ($num + 1)**2 / 4;
}

sub sum_of_squares {
	# Sum of the square of all natural numbers 0..$num
	my $this = shift;
	my $num = $this->{num};
	return $num * ($num + 1) * (2 * $num + 1) / 6;
}

sub difference {
	# difference betwen square_of_sums and sum_of_squares
	my $this = shift;
	my $num = $this->{num};
	return $num * ($num + 1) * ($num - 1) * (3 * $num + 2) / 12;
}

1;