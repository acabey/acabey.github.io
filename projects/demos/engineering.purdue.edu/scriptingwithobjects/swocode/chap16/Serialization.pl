#!/usr/bin/perl -w
use strict;

###  Serialization.pl

use Storable;                                                       #(A)

my $pets = ["poodle", "chihuahua", "huskie"];                       #(B)
my $fruit = { banana  =>  { color =>  'yellow',                     #(C)
                            price =>  0.35 },
              orange  =>  { color => 'orange',
                            price =>  0.28 } };
my $current_year = 2008;                                            #(D)
my $name = "Beeblecrox";                                            #(E)

eval {                                                              #(F)
    store( [$pets, $fruit, $current_year, $name], 'test.txt' );     #(G)
};
if ($@) {                                                           #(H)
    print "Error in eval: $@";                                      #(I)
}

#----------------------------------------------------------------------
# Retrieving data from the disk file:

my $recover = retrieve( 'test.txt' );                               #(J)

print $recover, "\n";                # ARRAY(0x805191c)             #(K)
my $beasts = $recover->[0];                                         #(L)
print "@$beasts\n";                  # poodle chihuahua huskie      #(M)

my $froot = $recover->[1];                                          #(N)
print "$froot\n";                    # HASH(0x808b798)              #(O)
my @allkeys = keys( %$froot );                                      #(P)
print "@allkeys\n";                  # orange banana                #(Q)

print "$recover->[2]\n";             # 2008                         #(R)

print "$recover->[3]\n";             # Beeblecrox                   #(S)
