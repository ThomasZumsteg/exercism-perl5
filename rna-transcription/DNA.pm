package DNA;

use strict;
use warnings;

# RNA string for DNA
sub to_rna { return $_[0] =~ tr/CGTA/GCAU/r; }

1;