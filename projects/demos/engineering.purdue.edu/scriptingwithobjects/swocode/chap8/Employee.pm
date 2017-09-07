#-------------  class Employee in file Employee.pm ----------------------
package Employee;                                                   #(E1)

use Person;
@Employee::ISA = ('Person');                                        #(E2)

sub new {                                                           #(E3)
    my ( $class, $name, $age, $position ) = @_;                     #(E4)
    my $instance = Person->new( $name, $age );                      #(E5)
    $instance->{_position} = $position;                             #(E6)
    bless $instance, $class;                                        #(E7)
}
sub get_position {                                                  #(E8)
    my $self = shift;                                               #(E9)
    $self->{_position};                                            #(E10)
}
my %_promotion_table = (                                           #(E11)
    shop_floor => "staff",                                         #(E12)
    staff => "management",                                         #(E13)
    astt_manager => "manager",                                     #(E14)
    manager => "executive",                                        #(E15)
);
sub promote {                                                      #(E16)
    my $self = shift;                                              #(E17)
    $self->{_position} =                 
                  $_promotion_table{ $self->{_position} };         #(E18)
}
1
