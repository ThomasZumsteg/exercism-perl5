package Minesweeper;

use strict;
use warnings;

sub count_adjacent_bombs {
	# Validates and add numbers to a minesweeper board
	my @board = split "\n", shift;
	validate_board(\@board);
	# Splits the board into an array of arrays
	@board = map {[split //]} @board;
	for (my $i = 1; $i < $#board; $i++) {
		for (my $j = 1; $j < $#{$board[$i]}; $j++){
			update_board(\@board, $i, $j) if '*' eq $board[$i][$j];
		}
	}
	return join '', map {join('', @$_) . "\n" } @board;
}

sub update_board {
	# Updates a position on the board
	my ($board, $iPos, $jPos) = @_;
	foreach my $i (($iPos - 1)..($iPos + 1)) {
		foreach my $j (($jPos - 1)..($jPos + 1)) {
			my $pos = \$board->[$i][$j];
			$$pos++ if $$pos =~ m/[1-8]/;
			$$pos = '1' if $$pos eq ' ';
		}
	}
}

sub validate_board {
	# Validates the board
	my @board = @{shift()};
	my $lineLength = length($board[0]) - 2;
	# Validates all normal lines
	m/^\|[ *]{$lineLength}\|$/ or die 'ArgumentError' foreach (@board[1..($#board-1)]);
	# Validates the end caps
	m/^\+-{$lineLength}\+$/ or die 'ArgumentError' foreach (@board[0,-1]);
}

1;