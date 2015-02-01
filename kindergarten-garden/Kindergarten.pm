package Kindergarten;

use strict;
use warnings;

sub new {
	# A kindergarden garden
	my ($class, $garden, $students) = @_;
	unless ( defined $students ) {
		# default student list
		$students = [qw/Alice Bob Charlie David
					    Eve Fred Ginny Harriet 
				        Ileana Joseph Kincaid Larry/];
	}
	$students = [sort @$students];
	# Plant list, left as ref incase it is passed in
	my $plants = { 'G' => 'grass',
				   'C' => 'clover',
				   'V' => 'violets',
				   'R' => 'radishes'
			  };
	# Students start with an empty garden
	my $self = {map {lc $_ => []} @$students};
	foreach my $row (split "\n", uc $garden) {
		for (my $i = 0; $i < length $row; $i += 2) {
			foreach my $letter (split //, substr $row, $i, 2) {
				# Adds plant to students list, by row, then position
				push @{$self->{lc $students->[$i/2]}}, $plants->{$letter}; 
			}
		}
	}
	bless $self , $class;
}

our $AUTOLOAD;
sub AUTOLOAD {
	# Returns the students garden
	my $self = shift;
	my $student = $AUTOLOAD =~ s/^.*:://r;
	return $self->{$student};
}

1;