#!/usr/bin/perl -w
use strict;

#  SubRefAnon.pl

# An anonymous subroutine:
my $ref_to_sub = sub {                                                 #(A)
    my ($number) = @_;                                            
    if ( $number % 2 == 0 ) {
        return "$number is even";                                 
    } else {
        return "$number is not even";                             
    }
};                                                                     #(B)

# A named subroutine:
sub even_p {                                                           #(C)
    my ($number) = @_;                                                 
    if ( $number % 2 == 0 ) {                                          
        return "$number is even";                                      
    } else {                                                           
        return "$number is not even";                                  
    }
}                                                                      #(D)

# A subroutine call via its reference:
print &$ref_to_sub( 18 ), "\n";              # 18 is even              #(E)

# A block returning the reference
print &{$ref_to_sub}( 19 ), "\n";            # 19 is not even          #(F)

# The arrow notation for dereference:                                      
print $ref_to_sub->(20), "\n";               # 20 is even              #(G)

# A regular subroutine call:
print &even_p( 21 ), "\n";                   # 21 is not even          #(H)
