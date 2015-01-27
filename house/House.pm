package House;

use strict;
use warnings;

# Items and actions in the house rhyme
my $house = [ {item=>"house that Jack built.\n"},
			  {item=>"malt", 								action=>"lay in"},
			  {item=>"rat", 								action=>"ate"},
			  {item=>"cat", 								action=>"killed"},
			  {item=>"dog", 								action=>"worried"},
			  {item=>"cow with the crumpled horn",  		action=>"tossed"},
			  {item=>"maiden all forlorn", 					action=>"milked"},
			  {item=>"man all tattered and torn", 			action=>"kissed"},
			  {item=>"priest all shaven and shorn", 		action=>"married"},
			  {item=>"rooster that crowed in the morn", 	action=>"woke"},
			  {item=>"farmer sowing his corn", 				action=>"kept"},
			  {item=>"horse and the hound and the horn", 	action=>"belonged to"},
			];

# A new House class, 
sub new { bless $house, shift }

sub recite {
	# Recites the whole rhyme
	my $self = shift;
	my @verses;
	for (my $i = 0; $i < @{$self}; $i++) {
		push @verses, $self->verse($i);
	}
	return join "\n", @verses;
}

sub verse {
	# A Verse of the rhyme, 0 numbered
	my ($self, $verse) = @_;
	my @lines = ("This is the $self->[$verse]->{item}");
	for (my $i = $verse; $i > 0; $i--) {
		push @lines, "that $self->[$i]->{action} the $self->[$i-1]->{item}";
	}
	return join "\n", @lines;
}

1;