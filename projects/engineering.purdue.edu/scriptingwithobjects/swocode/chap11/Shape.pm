# Shape.pm

package Shape;                               
use Carp;

sub import {                                                       #(S1)
    my $pkg = shift;                                               #(S2)

    my $caller = caller;
    print"The caller is $caller\n";
    print"The variable \$pkg is $pkg\n";
    print"The variable __PACKAGE__ is ", __PACKAGE__, "\n\n";

    return if $pkg eq __PACKAGE__;                                 #(S3)
    foreach my $meth ( qw( area circumference ) ) {                #(S4)
        $pkg->can($meth)                                           #(S5)
            or croak("Class $pkg does not define method $meth");   #(S6)
    }
}

sub baba {
    my $x = shift;
    print "inside baba, value of x is $x\n";
    print "called baba of Shape\n";
}

1;
