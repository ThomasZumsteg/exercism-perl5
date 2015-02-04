package Say;

use strict;
use warnings;

sub new {
	# Makes decimal number natural language numbers
	my ($class, $num) = @_;
	die "ArgumentError" unless 0 <= $num and $num < 1_000_000_000_000;
	bless \$num, $class;
}

sub in_english {
	# Says the number in natural language english
	my $self = shift;
	# Special case
	return 'zero' if $$self == 0;
	my @magnitudes = ('', ' thousand', ' million', ' billion', ' trillion');
	my $numString = '';
	my @mag = $self->makeMagnitude();
	foreach my $i (reverse (0..$#mag)) {
		next if $mag[$i] == 0;
		$numString .= ($numString ? ' ' : '') . saySmallNum($mag[$i]) . $magnitudes[$i];
	}
	return $numString;
}

sub makeMagnitude {
	# Breaks a large number into groups of three digits
	# (ones, thousands millions billions etc.)
	my @test = ((reverse ${shift()}) =~ m/\d{1,3}/g);
	return map { $_ = reverse $_ } @test;
}

sub saySmallNum {
	# Says numbers between 1 and 999
	# Splits number up into digits
	my ($hundreds, $tens, $ones) = ((sprintf "%03d", shift) =~ m/\d/g);

	# Words for numbers lists indexed to corresponding word
	my @digits = qw/zero one two three four five six seven eight nine/;
	my @tens = qw/zero ten twenty thirty forty fifty sixty seventy eighty ninety/;
	my @teens = qw/ten eleven twelve thiteen fourteen fifteen sixteen seventeen eighteen nineteen/;

	my $numberString = '';
	
	# Handles Hundreds
	$numberString .= "$digits[$hundreds] hundred" unless $hundreds == 0;
	
	# Early exit for numbers 10-19 because unusal
	return $numberString . ($numberString ? ' ' : '') . $teens[$ones] if $tens == 1;

	# Handles numbers 1-9 and 20-99
	$numberString .= ($numberString ? ' ' : '') . "$tens[$tens]" unless $tens == 0;
	$numberString .= ($tens == 0 ? ($numberString ? ' ' : '') : '-') . "$digits[$ones]" unless $ones == 0;
	return $numberString;
}

1;