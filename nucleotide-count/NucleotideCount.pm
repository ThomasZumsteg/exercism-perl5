package NucleotideCount;

use strict;
use warnings;

sub new {
	# Counts the occurance of nucleotides in a DNA string
	my ($class, $string) = @_;
	# Validates DNA string
	die "invalid" unless $string =~ m/^[GTAC]*$/;
	bless \$string, $class;
}

sub count {
	# Counts the number of occurences of an individual nucleotide
	my ($self, $nucleotide) = @_;
	# Validates nucleotide
	die "invalid" unless $nucleotide =~ m/^[GATC]$/;
	# regex put in list context
	return () = ${$self} =~ m/$nucleotide/gi;
}

sub nucleotide_counts {
	# Counts the occurence of all nucleotides
	my $self = shift();
	my %counts;
	$counts{$_} = $self->count($_) foreach (qw/G T A C/);
	return \%counts;
}

1;