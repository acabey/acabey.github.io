#!/usr/bin/perl -w
use strict;

#  SubRef.pl

sub even_p {                                                           #(A)
    my ($number) = @_;                                                 #(B)
    if ( $number % 2 == 0 ) {                                          #(C)
        return "$number is even";                                      #(D)
    } else {                                                           #(E)
        return "$number is not even";                                  #(F)
    }
}

sub multiple_of_3_p {                                                  #(G)
    my ($number) = @_;
    if ( $number % 3 == 0 ) {
        return "$number is a multiple of 3";
    } else {
        return "$number is not a multiple of 3";
    }
}

sub multiple_of_4_p {                                                  #(H)
    my ($number) = @_;
    if ( $number % 4 == 0 ) {
        return "$number is a multiple of 4";
    } else {
        return "$number is not a multiple of 4";
    }
}

print &even_p( 18 ), "\n";                 # 18 is even                #(I)
print &multiple_of_3_p( 18 ), "\n";        # 18 is a multiple of 3     #(J)
print &multiple_of_4_p( 18 ), "\n";        # 18 is not a multiple of 4 #(K)

push my @function_array, \&even_p;                                     #(L)
push @function_array, \&multiple_of_3_p;                               #(M)
push @function_array, \&multiple_of_4_p;                               #(N)

# This subroutine takes two arguments, the first a 
# reference to an array of function references, and 
# the second an integer argument.  Each function
# in the array is invoked on the second argument.
sub apply_funct_array {                                                #(O)
    my $ref_to_array = shift;                                          #(P)
    my $arg = shift;                                                   #(Q)
    foreach (@$ref_to_array) {                                         #(R)
        my $answer = &$_( $arg );                                      #(S)
        print $answer, "\n";                                           #(T)
    }
}

&apply_funct_array( \@function_array, 16 );                            #(U)
                                           # 16 is even
                                           # 16 is not a multiple of 3
                                           # 16 is a multiple of 4
