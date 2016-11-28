package Employee;     

### Employee.pm

use strict;

sub new {                                                           #(A)
    my ($class, %args) = @_;                                        #(B)
    bless {                                                         #(C)
        _name          =>   $args{ name },                          #(D)
        _age           =>   $args{ age },                           #(E)
        _gender        =>   $args{ gender },                        #(F)
        _title         =>   $args{ title },                         #(G)
        _dept          =>   $args{ dept },                          #(H)
        _grade         =>   $args{ grade },                         #(I)
    }, $class;                                                      #(J)
}

sub get_name { $_[0]->{_name} }                                     #(K)
sub get_age { $_[0]->{_age} }                                       #(L)
sub get_gender { $_[0]->{_gender} }                                 #(M)
sub get_title { $_[0]->{_title} }                                   #(N)
sub get_dept { $_[0]->{_dept} }                                     #(O)
sub get_grade { $_[0]->{_grade} }                                   #(P)

sub set_age { $_[0]->{_age} = $_[1] }                               #(Q)
sub set_title { $_[0]->{_title} = $_[1] }                           #(R)
sub set_dept { $_[0]->{_dept} = $_[1] }                             #(S)
sub set_grade { $_[0]->{_grade} = $_[1] }                           #(T)

1
