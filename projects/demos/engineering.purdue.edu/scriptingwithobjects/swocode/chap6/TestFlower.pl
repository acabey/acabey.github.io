#!/usr/bin/perl -w
use strict;

# TestFlower.pl

use Flower;

my $flower1 = Flower->new( "Rose" );                                #(A)

       # The user prompted for "season" by line (O) of Flower.pm
       # The user enters 'spring' in response

print $flower1->get_name, "\n";                # Rose               #(B)
print $flower1->get_season, "\n";              # spring             #(C)
print $flower1->get_fragrance, "\n";           # unknown            #(D)

my $flower2 = Flower->new();                                        #(E)
                   # name required at TestFlower.pl line 17

#$flower1->ask_for_season;
