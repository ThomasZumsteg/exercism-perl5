package FoodChainSong;

use strict;
use warnings;

sub new { 
	# A sings "I know an Old Lady who Swallowed a Fly"
	my $class = shift;
	bless { opening => "I know an old lady who swallowed ",
			firstLine => [ "",
						   "a fly.\n",
						   "a spider.\nIt wriggled and jiggled and tickled inside her.\n",
						   "a bird.\nHow absurd to swallow a bird!\n",
						   "a cat.\nImagine that, to swallow a cat!\n",
						   "a dog.\nWhat a hog, to swallow a dog!\n",
						   "a goat.\nJust opened her throat and swallowed a goat!\n",
						   "a cow.\nI don't know how she swallowed a cow!\n",
						   "a horse.\nShe's dead, of course!\n",
						],
			refrain => [ "I don't know why she swallowed the fly. Perhaps she'll die.\n",
						 "She swallowed the spider to catch the fly.\n",
						 "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n",
						 "She swallowed the cat to catch the bird.\n",
						 "She swallowed the dog to catch the cat.\n",
						 "She swallowed the goat to catch the dog.\n",
						 "She swallowed the cow to catch the goat.\n",
						],

		}, $class;

}

sub verse {
	# Sings a verse
	my ($self, $verse) = @_;
	my $lyrics = ($self->{opening} . $self->{firstLine}->[$verse]);
	
	# Stops on the last first line (swallowed a horse)
	return $lyrics if $#{$self->{refrain}} < ($verse - 1);
	
	# Add the chain of animals
	$lyrics .= $_ foreach (@{$self->{refrain}}[reverse 0..($verse-1)]);
	return $lyrics;
}

sub verses {
	# Sings a range of verses
	my ($self, $stop, $start) = @_;
	return join "", map {$self->verse($_) . "\n"} ($stop..$start);
}

# Sings the whole song
sub sing { shift->verses(1, 8) }

1;