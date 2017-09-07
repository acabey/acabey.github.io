package Bar;
use Carp;
use Foo;                                                           #(B1)
@ISA = qw( Foo );                                                  #(B2)

sub import {                                                       #(B3)
    my $pkg = shift;                                               #(B4)

    my $caller = caller;                                           #(B5)
    print"Bar: The caller is $caller\n";                           #(B6)
    print"Bar: The variable \$pkg is $pkg\n";                      #(B7)
    print"Bar: The variable __PACKAGE__ is ", __PACKAGE__, "\n\n"; #(B8)

    return if $pkg eq __PACKAGE__;                                 #(B9)
    foreach my $meth ( qw( bar ) ) {                              #(B10)
        $pkg->can( $meth )                                        #(B11)
            or croak("Class $pkg does not define method $meth");  #(B12)
    }
    $pkg->SUPER::import( @_ );                                    #(B13)
}

1;                                                                #(B14)
