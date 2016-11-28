#!/usr/bin/perl -w
#use strict;

# EvalForExceptions3.pl

#------------------------  base class Exception  ----------------------
package Exception;                                                 #(A)
sub new {                                                          #(B)
    my ( $class ) = @_;                                            #(C)
    bless {}, $class;                                              #(D)
}                                            

#---------------  derived class VolumeNegativeException  --------------
package VolumeNegativeException;                                   #(E)
@VolumeNegativeException::ISA = ('Exception');                     #(F)
sub toString {                                                     #(G)
    "Negative volume is not allowed. Start over.\n";               #(H)
}

#---------------  derived class LengthNegativeException  --------------
package LengthNegativeException;                                   #(I)
@LengthNegativeException::ISA = ('Exception');                     #(J)
sub toString {                                                     #(K)
    "Length must be a positive number. Start over.\n";
}

#----------------  derived class WidthNegativeException  --------------
package WidthNegativeException;                                    #(L)
@WidthNegativeException::ISA = ('Exception');
sub toString {
    "Width must be a positive number. Start over.\n";
}

#---------------------  class HeightCalculator  -----------------------
package HeightCalculator;                                          #(M)

my $errVol    = VolumeNegativeException->new();                    #(N)
my $errLength = LengthNegativeException->new();                    #(O)
my $errWidth  = WidthNegativeException->new();                     #(P)

while (1) {                                                        #(Q)
    eval {                                                         #(R)
        print "What is the volume: "; chomp( my $vol = <STDIN> );  #(S)
        die $errVol if $vol < 0;                                   #(T)

        print "What is the length: "; chomp(my $length = <STDIN>); #(U)
        die $errLength if $length <= 0;                             

        print "What is the width: "; chomp( my $width = <STDIN> ); #(V)
        die $errWidth if $width <= 0;

        print "The height is: ", $vol / ($length * $width), "\n";  #(W)
    };
    print $@->toString() if $@;                                    #(X)
}
