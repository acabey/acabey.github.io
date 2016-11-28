#!/usr/bin/perl -w

### MemoryTestWithActualSize.pl

use strict;

#------------------------  class MemoryBlock  --------------------------
package MemoryBlock;                                                #(A)

    use Devel::Size qw(size);                                       #(B)

    sub new {                                                       #(C)
        my ( $class, $id, $size ) = @_;                             #(D)
        my @arr = ();                                               #(E)
        $#arr = $size - 1;                                          #(F)
        my $block_ref = {                                           #(G)
            id => $id,                                              #(H)
            size => $size,                                          #(I)
            array_ref => \@arr,                                     #(J)
            };
        bless $block_ref, $class;
        print "MemoryBlock created: " . "{id=" . $block_ref->{id} . #(K) 
            ", array size=" . $block_ref->{size} . "}" .            #(L)
            ", actual size=" . size( \@arr ) . "\n";                #(M)
        $block_ref;
    }

    sub get_print_representation {                                  #(N)
        my $block_ref = shift;  
        return "{id=" . $block_ref->{id} . 
            ", size=" . $block_ref->{size} . "}";
    }

    sub DESTROY {                                                   #(O)
        my $block_ref = shift;
        print "MemoryBlock about to be destroyed: {id=" . 
            $block_ref->{id} .         
            ", size=" . $block_ref->{size} . "}" . "\n";
    }

#----------------------------  Test Code  ------------------------------
package main;

use Devel::Size qw(total_size);                                     #(P)

my @blocks = ();                                                    #(Q)
my $size = 262144;                                                  #(R)

my $i = 0;
while ( $i < 2 ) {                                                  #(S)
    $blocks[$i] = MemoryBlock->new( $i, $size );                    #(T)
    print "The actual size of the MemoryBlock $i is: " .            #(U)
                total_size( $blocks[$i] ). "\n";                    #(V)
    print_blocks(\@blocks);                                         #(W)
    $size *= 2;                                                     
    $i++;                                                           
}

sub print_blocks {                                                  #(X)
    my $ref_all_blocks = shift;
    print "All blocks: ";
    foreach ( @$ref_all_blocks ) {                                  
        print $_->get_print_representation;                         
    }
    print "\n\n";
}
