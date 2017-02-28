# HelloModule2.pm

package HelloModule2;                                               #(A)
#use strict;
use Exporter;                                                       #(B)

@ISA = ( 'Exporter' );                                              #(C)

@EXPORT_OK = ( 'say_loud_hello', 'say_soft_hello' );                #(D)

sub say_loud_hello {                                                #(E)
    print "HELLO!!! HOW ARE YOU!!!\n";
}

sub say_soft_hello {                                                #(F)
    print "hi dear! how are you this morning!\n";
}

1 
