package Say;

use strict;
use warnings;

sub new {
	my ($class, $num) = @_;
	die "ArgumentError" unless 0 <= $num and $num < 1_000_000_000_000;
	bless \$num, $class;
}

sub in_english {
	my $self = shift;
	return 'zero' if $$self == 0;
	my @magnitudes = ('', qw/thousand million billion trillion/);
	my $numString = '';
	my @mag = $self->makeReverseMagnitude();
	foreach my $i (0..$#mag) {
		my $magStr = saySmallNum($mag[$i]);
		$numString = $mag[$i] == 0 ? $numString : "$magStr $magnitudes[$i] $numString";
	}
	return $numString;
}

sub makeReverseMagnitude {
	my @test = ((reverse ${shift()}) =~ m/\d{1,3}/g);
	return map { $_ = reverse $_ } @test;
}

sub saySmallNum {
	my ($hundereds, $tens, $ones) = ((sprintf "%03d", shift) =~ m/\d/g);
	my @digits = ('', qw/one two three four five six seven eight nine/);
	my @teens =  qw/ten eleven twelve thiteen fourteen fifteen sixteen seventeen eighteen nineteen/;
	my @tens = ('', qw/ten twenty thirty fourty fifty sixty seventy eighty ninety/);
	my $numberString = '';
	$numberString .= "$digits[$hundereds] hundered" unless $hundereds == 0;
	return "$numberString $teens[$ones]" if $tens == 1;
	$numberString .= ($hundereds == 0 ? '' : ' ') . "$tens[$tens]" unless $tens == 0;
	$numberString.= ($tens == 0 ? '' : '-') . "$digits[$ones]" unless $ones == 0;
	return $numberString;
}

# print saySmallNum(119) . "\n";


1;