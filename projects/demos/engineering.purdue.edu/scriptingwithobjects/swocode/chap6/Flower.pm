package Flower;                          

### Flower.pm

use strict;                              
use Carp;

sub new {                                                           #(A)
    my ($class, $name, $season, $frag) = @_;                        #(B)
    bless {                                                         #(C)
        _name        =>   $name   || croak("name required"),        #(D)
        _season      =>   $season || _ask_for_season($name),        #(E)
        _fragrance   =>   $frag   || 'unknown',                     #(F)
    }, $class;                                                      #(G)
}    

sub get_name { $_[0]->{_name}; }                                    #(H)
sub get_season { $_[0]->{_season}; }                                #(I)
sub get_fragrance { $_[0]->{_fragrance}; }                          #(J)

sub set_season { $_[0]->{season} = $_[1] }                          #(K)
sub set_fragrance { $_[0]->{fragrance} = $_[1] }                    #(L)

sub _ask_for_season {                                               #(M)
    my $flower = shift;                                             #(N)
    print STDOUT "enter the season for $flower: ";                  #(O)
    chomp( my $response = <> );                                     #(P)
    $response;                                                      #(Q)
}

1 
