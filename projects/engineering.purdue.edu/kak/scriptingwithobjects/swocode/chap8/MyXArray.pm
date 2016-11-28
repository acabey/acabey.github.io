package MyXArray;                                                   #(A)

### MyXArray.pm

use strict;                      
use Carp;
use XArray;   # This is XArray.pm from Section 6.9 of Chapter 6     #(B)

#use overload '""'  => '_str';                                      #(C)

@MyXArray::ISA = ('XArray');                                        #(D)

# Constructor
sub new {                                                           #(E)
    my ($class, $arr_ref) = @_;                              
    bless {                                                  
        _arr => $arr_ref,                                    
        _size  => scalar( @$arr_ref ),                       
        _how_many_nums => scalar( grep /^\d+$/, @$arr_ref ),        #(F)
    }, $class;                                               
}                                                            

sub get_how_many_nums { $_[0]->{_how_many_nums}; }                  #(G)

sub _str {                                                          #(H)
    my $self = shift;
    return join("____", @{$self->{_arr}});                          #(I)
}

1
