package Baz;

use Bar;                                                           #(Z1)
@ISA = qw( Bar );                                                  #(Z2)

sub new {                                                          #(Z3)
    my ($class) = @_;                                              #(Z4)
    my $ref = {};                                                  #(Z5)
    bless $ref, $class;                                            #(Z6)
    $ref;                                                          #(Z7)
}

sub foo { print "This is method foo\n"; }                          #(Z8)
sub bar { print "This is method bar\n"; }                          #(Z9)

1;                                                                #(Z10)
