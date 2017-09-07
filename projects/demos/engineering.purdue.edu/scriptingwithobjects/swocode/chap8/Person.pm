### Person.pm

#---------------  class Person in file Person.pm  ----------------------
package Person;                                                     #(P1)

sub new {                                                           #(P2)
    my ( $class, $name, $age ) = @_;                                #(P3)
    my $instance = {                                                #(P4)
        _name => $name,                                             #(P5)
        _age => $age,                                               #(P6)
    };
    bless $instance, $class;                                        #(P7)
}
sub get_name {                                                      #(P8)
    my $self = shift;                                               #(P9)
    $self->{_name};                                                #(P10)
}
sub get_age {                                                      #(P11)
    my $self = shift;                                              #(P12)
    $self->{_age};                                                 #(P13)
}
1

