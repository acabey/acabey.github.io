#!/usr/bin/perl -w

### MemoryTestWithWeakRef.pl

use strict;
use Scalar::Util qw(weaken);     

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
        print "\nMemoryBlock created: " .                           #(J) 
            "{id=" . $block_ref->{id} . 
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
package main;                                                       #(M)

my @blocks = ();                                                    #(N)
my $size = 262144;                                                  #(O)

my $i = 0;
while (1) {                                                         #(P)
    $blocks[$i] = MemoryBlock->new( $i, $size );                    #(Q)
    print_blocks(\@blocks);                                         #(R)
    weaken $blocks[$i];                                             #(S)
    $size *= 2;                                                     #(T)
    $i++;                                                           #(U)
}

sub print_blocks {                                                  #(V)
    my $ref_all_blocks = shift;
    print "All blocks: ";
    foreach ( @$ref_all_blocks ) {                                  #(W)
        print $_->get_print_representation if defined;              #(X)
    }
    print "\n";
}
