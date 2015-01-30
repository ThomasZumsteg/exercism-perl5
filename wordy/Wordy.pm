package Wordy;

use warnings;
use strict;

my %tokens = (  "plus" => "+",
				"minus" => "-",
				"multiplied by" => "*",
				"divided by" => "/",
		     );

sub answer {
	# Evaluates a natural language math equation
	my $phrase = lc shift;

	# Tokenizes the phrase into (digit) (operator) (digit) etc.
	my $operators = join "|", keys %tokens;
	# Validates phrase
	$phrase =~ m/^what is -?\d+( ($operators) -?\d+)+\?$/ or die "ArgumentError";
	$phrase =~ s/(^what is |\?$)//g;
	while (my ($key, $val) = each %tokens) { $phrase =~ s/$key/$val/g }

	# Evaluates each set of operators
	my @symbols = split ' ', $phrase;
	my $result = shift @symbols;
	while (@symbols) {
		my $operator = shift(@symbols);
		my $number = shift(@symbols);
		$result = eval "$result $operator $number";
	}
	return $result;
}

1;