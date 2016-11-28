#!/usr/bin/perl -w

### MemoryTest.pl

use strict;

#------------------------  class MemoryBlock  --------------------------
package MemoryBlock;                                                #(A)
    sub new {                                                       #(B)
        my ( $class, $id, $size ) = @_;                             #(C)
        my @arr = ();                                               #(D)
        $#arr = $size - 1;                                          #(E)
        my $block_ref = {                                           #(F)
            id => $id,                                              #(G)
            size => $size,                                          #(H)
            array_ref => \@arr,                                     #(I)
            };
        bless $block_ref, $class;
        print "MemoryBlock created: " . "{id=" . $block_ref->{id} . #(J) 
            ", size=" . $block_ref->{size} . "}" . "\n";
        $block_ref;
    }

    sub get_print_representation {                                  #(K)
        my $block_ref = shift;  
        return "{id=" . $block_ref->{id} . 
            ", size=" . $block_ref->{size} . "}";
    }

    sub DESTROY {                                                   #(L)
        my $block_ref = shift;
        print "MemoryBlock about to be destroyed: {id=" . 
            $block_ref->{id} .         
            ", size=" . $block_ref->{size} . "}" . "\n";
    }

#----------------------------  Test Code  ------------------------------
package main;

my @blocks = ();                                                    #(M)
my $size = 262144;                                                  #(N)

my $i = 0;
while (1) {                                                         #(O)
    $blocks[$i] = MemoryBlock->new( $i, $size );                    #(P)
    print_blocks(\@blocks);                                         #(Q)
    $size *= 2;                                                     #(R)
    $i++;                                                           #(S)
}

sub print_blocks {                                                  #(T)
    my $ref_all_blocks = shift;
    print "All blocks: ";
    foreach ( @$ref_all_blocks ) {                                  #(U)
        print $_->get_print_representation;                         #(V)
    }
    print "\n\n";
}
