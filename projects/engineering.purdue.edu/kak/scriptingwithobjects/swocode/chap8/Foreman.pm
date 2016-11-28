#----------------  class Foreman in Foreman.pm file  -------------------
package Foreman;                                           
use Worker;
@Foreman::ISA = ("Worker");                            

sub new {                                                          #(F1)
    my ( $class, $name, $position, $department ) = @_;
    my $instance = Worker->new( $name, $position );                #(F2)
    $instance->{_department} = $department;
    bless $instance, $class;
}
sub get_department {
    my $self = shift;      
    $self->{_department};
}
sub promote {                                                      #(F3)
    my $self = shift;
    die "A Foreman cannot be promoted beyond 'Manager'"
        if $self->{_position} eq 'manager';
    #call base class's promote by specifying 
    #base class name explicitly:
    $self->Worker::promote();                                      #(F4)
}
sub print {                                                        #(F5)
    my $self = shift;
    $self->SUPER::print();                                         #(F6)
    print "$self->{_department}\n";                                #(F7)
}
1
