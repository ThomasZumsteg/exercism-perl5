package SecretHandshake;

use strict;
use warnings;

sub new{
	my ($class, $number) = @_;
	bless \$number, $class;
}

# Possiable handshake steps, starting from least significant bit to most
my @steps = (sub {return (@{shift()}, "wink")},
			 sub {return (@{shift()}, "double blink")},
			 sub {return (@{shift()}, "close your eyes")},
			 sub {return (@{shift()}, "jump")},
			 sub {return reverse @{shift()} },
			);

sub commands {
	# Makes the secret handshake
	my $self = shift;
	return [] unless $$self =~ m/^[0-9]+$/;
	my @handshake;
	foreach (0..$#steps) {
		@handshake = $steps[$_]->(\@handshake) if (1 << $_) & $$self;
	}
	return \@handshake;
}

1;