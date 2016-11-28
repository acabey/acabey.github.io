#!/usr/bin/perl -w
use strict;

# SubroutineChaining.pl

# The following subroutine squares its arg but 
# returns a reference to another subroutine
sub funct1 {                                                          #(A)     
    my ($arg) = shift;                                                #(B)
    my $result = $arg * $arg;                                         #(C)
    print "$arg squared gives us $result";                            #(D)
    return \&funct2;                                                  #(E)
}

# This is the other subroutine to which a reference 
# is returned by the above subroutine.  This subroutine
# cubes its argument.
sub funct2 {                                                          #(F)
    my ($arg) = shift;                                                #(G)
    my $result = $arg * $arg * $arg;                                  #(H)
    print " and $arg cubed gives us $result\n";                       #(I)
}

# One way to chain the two subroutines:
&funct1(10)->(10);                                                    #(J)
        # output: 10 squared gives us 100 and 10 cubed gives us 1000

# Another way to chain the two subroutines:
my $funct_ref = \&funct1;                                             #(K)
$funct_ref->(30)->(40)                                                #(L)
        # output: 30 squared gives us 900 and 40 cubed gives us 64000 
