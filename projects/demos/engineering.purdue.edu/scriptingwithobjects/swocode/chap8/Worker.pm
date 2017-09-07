#----------------  class Worker in Worker.pm file  --------------------
package Worker;                                           
sub new {                                                          #(W1)
    my ( $class, $name, $position ) = @_;                 
    my $instance = {                                         
        _name => $name,   
        _position => $position,                       
    };
    bless $instance, $class;                            
}
sub get_position {                                                 #(W2)
    my $self = shift;                          
    $self->{_position};                  
}
sub set_position {                                                 #(W3)
    my $self = shift;
    $self->{_position} = shift;
}
my %_promotion_table = (                                           #(W4)
    shop_floor  => "team_leader",
    team_leader => "group_lead",
    group_lead  => "forman",
    foreman     => "manager",
);
sub promote {                                                      #(W5)
    my $self = shift;      
    $self->{_position} = 
              $_promotion_table{ $self->{_position} };
}
sub print {                                                        #(W6)
    my $self = shift;
    print "$self->{_name}  $self->{_position}  ";
}
1
