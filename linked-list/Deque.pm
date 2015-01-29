package Deque;

use warnings;
use strict;

# A linked list class
sub new{ bless [], CORE::shift }

# The functions are all just wrappers of existing core perl functions

# Returns and removes the last element of the list
sub pop { return pop @{$_[0]} }

# Returns and removes the first element of the list
sub shift { return CORE::shift @{$_[0]} }

# Adds a new element to the end of the list
sub push { push @{$_[0]}, $_[1] }

# Adds a new element to the start of the list
sub unshift { unshift @{$_[0]}, $_[1]}

1;