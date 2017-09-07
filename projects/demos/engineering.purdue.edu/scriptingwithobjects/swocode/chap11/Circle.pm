package Circle;

# Circle.pm

#use Shape;                                                         #(C1)
BEGIN {
    require Shape;
    Shape->import();
#    import Shape;
}

@ISA = qw(Shape);                                                  #(C2)

sub new {                                                          #(C3)
    my ($class, $rad) = @_;                                        #(C4)
    my $r_circle = {                                               #(C5)
        radius => $rad,                                            #(C6)
    };     
    bless $r_circle, $class;                                       #(C7)
    $r_circle;                                                     #(C8)
}

sub area {                                                         #(C9)
    my $circle = shift;                                           #(C10)
    my $radius = $circle->{radius};                               #(C11)
    3.14159 * $radius * $radius;                                  #(C12)
}

sub circumference {                                               #(C13)
    my $circle = shift;                                           #(C14)
    my $radius = $circle->{radius};                               #(C15)
    2* 3.14159 * $radius;                                         #(C16)
}

1;                                                                #(C17)
