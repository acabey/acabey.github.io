package Foo;
use Carp;

sub import {                                                       #(F1)
    my $pkg = shift;                                               #(F2)

    my $caller = caller;                                           #(F3) 
    print"Foo: The caller is $caller\n";                           #(F4)
    print"Foo: The variable \$pkg is $pkg\n";                      #(F5)
    print"Foo: The variable __PACKAGE__ is ", __PACKAGE__, "\n\n"; #(F6)

    return if $pkg eq __PACKAGE__;                                 #(F7)
    foreach my $meth ( qw( foo ) ) {                               #(F8)
        $pkg->can( $meth ) or                                      #(F9)
            croak("Class $pkg does not define method $meth");     #(F10)
    }
    $pkg->SUPER::import( @_ );                                    #(F11)
}

1;                                                                #(F12)
