package Queens;

use strict;
use warnings;

sub new {
	# Tracks the position of Queens on a chess board
	my $class = shift;
	my %args = @_ ? @_ : ("white", [0, 3], "black", [7, 3]);
	die "ArgumentError" if join(',', @{$args{white}}) eq join(',', @{$args{black}});
	foreach ((@{$args{white}}, @{$args{black}})) {
		die "ArgumentError" unless 0 <= $_ and $_ < 8
	}
	bless \%args, $class;
}

# Returns the positions of the pieces
sub white { return shift()->{white}}
sub black { return shift()->{black}}

sub to_string {
	# Returns a string representation of the board
	my $self = shift;
	my $whitePos = join ',', @{$self->{white}};
	my $blackPos = join ',', @{$self->{black}};
	my $board;
	for (my $i = 0; $i <= 7; $i++){
		my @row;
		for (my $j = 0; $j <= 7; $j++) {
			if ($whitePos eq "$i,$j") { push @row, 'W' }
			elsif ($blackPos eq "$i,$j") {push @row,'B'}
			else {push @row, 'O'}
		}
		$board .= (join' ', @row) . "\n";
	}
	return $board;
}

sub can_attack {
	# If the queens can attach each other
	my $self = shift;
	my ($whiteX, $whiteY) = @{$self->{white}};
	my ($blackX, $blackY) = @{$self->{black}};
	
	# direct attack
	return 1 if $whiteX == $blackX or $whiteY == $blackY;
	
	# diagonal attack
	my ($diffX, $diffY) = ($whiteX - $blackX, $whiteY - $blackY);
	return 1 if $diffX == $diffY or $diffX == -$diffY;
	
	# Cannot attack
	return 0;
}

1;