package Rectangle;

# Rectangle.pm

#use Shape;                                                         #(R1)

BEGIN {
    require Shape;
    Shape->import();
#    import Shape;
}

@ISA = qw(Shape);                                                  #(R2)

sub new {                                                          #(R3)
    my ($class, $h, $w) = @_;                                      #(R4)
    my $r_rect = {                                                 #(R5)
        height => $h,                                              #(R6)
        width  => $w,                                              #(R7)
    };
    bless $r_rect, $class;                                         #(R8)
    $r_rect;                                                       #(R9)
}

sub area {                                                        #(R10)
    my $rect = shift;                                             #(R11)
    my $w = $rect->{width};                                       #(R12)
    my $h = $rect->{height};                                      #(R13)
    $w * $h;                                                      #(R14)
}

sub circumference {                                               #(R15)
    my $rect = shift;                                             #(R16)
    my $w = $rect->{width};                                       #(R17)
    my $h = $rect->{height};                                      #(R18)
    2 * ( $w + $h );                                              #(R19)
}

1;                                                                #(R20)
