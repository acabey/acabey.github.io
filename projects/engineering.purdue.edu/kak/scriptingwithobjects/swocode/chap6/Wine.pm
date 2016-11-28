package Wine;     

### Wine.pm

use strict;
use Carp;

sub new {                                                           #(A)
    my ($class, %args) = @_;                                        #(B)
    bless {                                                         #(C)
        _grape           =>   $args{ grape }    
                              || croak("grape required"),           #(D)
        _color           =>   $args{ color }
                              || croak("color required"),           #(E)
        _vintage         =>   $args{ vintage } 
                              || 'unknown',                         #(F)
        _growing_region  =>   $args{ region }
                              || 'unknown',                         #(G)
        _dryness         =>   $args{ dryness }
                              || 'unknown',                         #(H)
    }, $class;                                                      #(I)
}

sub get_grape { $_[0]->{_grape} }                                   #(J)
sub get_color { $_[0]->{_color} }                                   #(K)
sub get_vintage { $_[0]->{_vintage} }                               #(L)
sub get_growing_region { $_[0]->{_growning_region} }                #(M)
sub get_dryness { $_[0]->{_dryness} }                               #(N)

sub set_color { $_[0]->{_color} = $_[1] }                           #(O)
sub set_vintage { $_[0]->{_vintage} = $_[1] }                       #(P)
sub set_growing_region { $_[0]->{_growing_region} = $_[1] }         #(Q)
sub set_dryness { $_[0]->{_dryness} = $_[1] }                       #(R)

1
