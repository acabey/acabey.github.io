#!/usr/bin/perl -w                                          
use strict;                                                 


my $string = "The difference between reality and fiction?" .          #(A)    
             "The fiction has to make sense";                         #(B)

#my $str = "fiction";                                                  #(C)

my $where = 0;                                                        #(D)
until ( $where == -1 ) {                                              #(E)
    $where = index( $string, $str, $where );                          #(F)
    unless ( $where == -1 ) {                                         #(G)
        print "$where\n";                                             #(H)
        $where++                                                      #(I)
    };
}    



