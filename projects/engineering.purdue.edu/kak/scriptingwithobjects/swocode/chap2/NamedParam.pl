#!/usr/bin/perl -w

### NamedParam.pl

use strict;

my %result = volume_calc( length => 10,                            #(A)
                          width  => 5,                             #(B)
                          height => 8 );                           #(C)

print "Area: $result{area} and Volume: $result{volume}\n";         #(D)
                                 # Area: 50 and Volume: 400

sub volume_calc {                                                  #(E)
    my %args = @_;                                                 #(F)
    my $length = $args{length};                                    #(G)
    my $width = $args{width};                                      #(H)
    my $height = $args{height};                                    #(I)

    my $area = $length * $width;                                   #(J)
    my $volume = $area * $height;                                  #(K)

    return (area => $area, volume => $volume);                     #(L)
}
