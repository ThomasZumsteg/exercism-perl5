package OCR;

use warnings;
use strict;

# globals
my ($g_gridWidth, $g_gridHeight) = (3,4);
my $g_charToASCIIhash = {
	" _ \n| |\n|_|\n   " => '0',   
	"   \n  |\n  |\n   " => '1',
	" _ \n _|\n|_ \n   " => '2',
	" _ \n _|\n _|\n   " => '3',
	"   \n|_|\n  |\n   " => '4',
	" _ \n|_ \n _|\n   " => '5',
	" _ \n|_ \n|_|\n   " => '6',
	" _ \n  |\n  |\n   " => '7',
	" _ \n|_|\n|_|\n   " => '8',
	" _ \n|_|\n _|\n   " => '9',
};

sub new {
	# Identifies OCR characters made of pipes and bars
	my ($class, $ocrString) = @_;
	bless \$ocrString, $class;
}

sub convert {
	# Converts from pipes and bars to characters
	my $inputString = ${shift()};
	my @strings;
	foreach my $rowGroup ( @{splitIntoRowGroups($inputString)} ) {
		my $string;
		foreach my $character ( @{splitIntoCharacters($rowGroup)} ) {
			$string .= ocrCharacterToASCII($character);
		}
		push @strings, $string;
	}
	return join ',', @strings;
}

# Splits a multi-line OCR string into single character height rows 
sub splitIntoRowGroups { return [(shift . "\n") =~ m/((?|.*?\n){$g_gridHeight})/g] }

sub splitIntoCharacters {
	# Splits an ORC multi-line string into individual characters
	my @rows = split "\n", shift;
	my @characters;
	while (my ($i, $row) = each @rows) {
		my @characterRows = ($row =~ m/(.{$g_gridWidth})/g);
		while (my ($j, $characterRow) = each @characterRows) {
			$characters[$j] = $characterRow if $i == 0;
			$characters[$j] .= "\n" . $characterRow if $i > 0;
		}
	}
	return \@characters;
}

sub ocrCharacterToASCII {
	# Converts an OCR character to the corresponding ASCII character
	my $char = shift;
	return $g_charToASCIIhash->{$char} if exists $g_charToASCIIhash->{$char};
	return '?';
}

1;