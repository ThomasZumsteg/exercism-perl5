package Word;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.00;
@ISA = qw(Exporter);
@EXPORT = ();
@EXPORT_OK = qw(convert);
%EXPORT_TAGS = ( DEFAULT => [qw(&convert)],
);

sub new {
	# Scabble word score class
	my $class = shift;
	my ($word) = @_;

	return bless {
			word => $word,
		}, $class;
}

# Scrabble letter scores
my %letters = (A => 1, E => 1, I => 1, O => 1, U => 1, 
			   L => 1, N => 1, R => 1, S => 1, T => 1,
			   D => 2, G => 2,
			   B => 3, C => 3, M => 3, P => 3,
			   F => 4, H => 4, V => 4, W => 4,Y => 4,
			   K => 5,
			   J => 8, X => 8,
			   Q => 10, Z => 10 );

sub score {
	# Calculates score
	my ($self, %mods) = @_;
	my $score = 0;

	foreach my $letter (split //, $self->{word}) {
		$score += $letters{uc $letter};
	}

	# Word score modifiers
	my %modifiers = (double => 2, triple => 3);
	while (my($key, $val) = each %mods) {
		$score *= $modifiers{$key}**$val;
	}

	# Letter modifiers go here?
	
	return $score;
}

1;