#--------------------------  class Manager  -----------------------------
package Manager;                                                    #(M1)

use Employee;
use ExecutivePerks;
@Manager::ISA = ("Employee", "ExecutivePerks");                     #(M2)

sub new {                                                           #(M3)
    my ( $class, $name, $age, $position, $department ) = @_;        #(M4)
    my $instance = Employee->new( $name, $age, $position );         #(M5)
    $instance->{_department} = $department;                         #(M6)
    bless $instance, $class;                                        #(M7)
}
sub get_department {                                                #(M8)
    my $self = shift;                                               #(M9)
    $self->{_department};                                          #(M10)
}
1
