package TwelveDays;

use strict;
use warnings;

sub new {
	# Sings the 12 days of christmas
	my $class = shift;
	my $daysOfChristmas = [
		{day => 'first', nth => 'and', thing => 'a Partridge in a Pear Tree.'},
		{day => 'second', nth => 'two', thing => 'Turtle Doves'},
		{day => 'third', nth => 'three', thing => 'French Hens'},
		{day => 'fourth', nth => 'four', thing => 'Calling Birds'},
		{day => 'fifth', nth => 'five', thing => 'Gold Rings'},
		{day => 'sixth', nth => 'six', thing => 'Geese-a-Laying'},
		{day => 'seventh', nth => 'seven', thing => 'Swans-a-Swimming'},
		{day => 'eighth', nth => 'eight', thing => 'Maids-a-Milking'},
		{day => 'ninth', nth => 'nine', thing => 'Ladies Dancing'},
		{day => 'tenth', nth => 'ten', thing => 'Lords-a-Leaping'},
		{day => 'eleventh', nth => 'eleven', thing => 'Pipers Piping'},
		{day => 'twelfth', nth => 'twelve', thing => 'Drummers Drumming'},
	];
	bless $daysOfChristmas, $class;
}

sub verse {
	# Sings a verse of the 12 Days of Christmas
	my ($self, $verseNum) = @_;
	my $verseString = sprintf "On the %s day of Christmas my true love gave to me", $self->[$verseNum - 1]->{day};
	# On all other verses it's ",[ and] a Partridge in a Pear Tree."
	return $verseString . ", a Partridge in a Pear Tree.\n" if $verseNum == 1;
	foreach my $dayNum (reverse 0..($verseNum - 1)) {
		my ($nth, $thing) = ($self->[$dayNum]->{nth}, $self->[$dayNum]->{thing});
		# [five] [Gold Rings]
		$verseString .= ", $nth $thing";
	}
	return $verseString . "\n";
}

sub verses {
	# Sings a set of verses from the 12 Days of Christmas
	my ($self, $stop, $start) = @_;
	my @verses;
	push @verses, ($self->verse($_) . "\n") foreach ($stop..$start);
	return join "", @verses;
}

# Sings all the verses of the 12 Days of Chritsmas
sub sing { return shift->verses(1, 12)}

1;