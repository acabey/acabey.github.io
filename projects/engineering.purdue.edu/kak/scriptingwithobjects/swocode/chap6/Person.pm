package Person;                                                     #(A)

### Person.pm

use strict;                                                         #(B)

sub new {                                                           #(C)
    my ($class, $name, $age) = @_;                                  #(D)
    bless {                                                         #(E)
        _name => $name,                                             #(F)
        _age  => $age,                                              #(G)
    }, $class;                                                      #(H)
}                                                                   #(I)

sub get_name { $_[0]->{_name}; }                                    #(J)

sub get_age { $_[0]->{_age}; }                                      #(K)

sub set_age {                                                       #(L)
    my ($self, $age) = @_;                                          #(M)
    $self->{_age} = $age;                                           #(N)
}

1                                                                   #(O)
