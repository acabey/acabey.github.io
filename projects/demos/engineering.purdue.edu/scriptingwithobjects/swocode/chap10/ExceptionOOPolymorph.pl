#!/usr/bin/perl -w
use strict;

# ExceptionOOPolymorph.pl

use Exception qw(:all);                                             #(A)

#-------------------  base exception class Error  ---------------------
package Error;                                                      #(B)
@Error::ISA = ('Exception');                                        #(C)

#------------------  derived class SpecialError_1  --------------------
package SpecialError_1;                                             #(D)
@SpecialError_1::ISA = ('Error');                                   #(E)

#--------------  further derived class SpecialError_2  ----------------
package SpecialError_2;                                             #(F)
@SpecialError_2::ISA = ('SpecialError_1');                          #(G)

#---------------------------  Test Code   -----------------------------

package MyWork;                                                     #(H)

use Exception qw(:all);                                             #(I)

my $err1 = new SpecialError_1 'e1', 'throwing e1 exception';        #(J)

my $err2 = new SpecialError_2 'e2', 'throwing e2 exception';        #(K)

try {                                                               #(L)
#    $err1->raise( "exception object's id is e1" );                 #(M)
    $err2->raise( "exception object's id is e2" );                  #(N)
} when $err1, except {                                              #(O)
    print "this is a handler for err1\n";                           #(P)
    shift->confess;                                                 #(Q)
} when $err2, except {                                              #(R)
    print "this is a handler for err2\n";                           #(S)
    shift->confess;                                                 #(T)
}
