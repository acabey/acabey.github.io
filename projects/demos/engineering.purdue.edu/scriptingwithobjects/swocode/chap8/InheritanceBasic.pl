#!/usr/bin/perl -w
#use strict;

###  InheritanceBasic.pl

#----------------------------  Class X  -------------------------------
package X;                                                          #(A)

use Exporter;
@ISA = ('Exporter');
sub new { bless {}, $_[0] }                                         #(B)
sub foo { print "X's foo called\n" }                                #(C)

use strict;
#----------------------------  Class Y  -------------------------------
package Y;                                                          #(D)
sub new { bless {}, $_[0] }                                         #(E)
sub bar { print "Y's bar called\n" }                                #(F)

#----------------------------  Class Z  -------------------------------
package Z;                                                          #(G)
@Z::ISA = qw( X Y );                                                #(H)
sub new { bless {}, $_[0] }                                         #(I)

#----------------------  end of class definitions ---------------------

package main;                                                       #(J)

print join ' ', keys %Z::, "\n";     # ISA new                      #(K)

my $zobj = Z->new();                                                #(L)
$zobj->foo();                        # X's foo called               #(M)
print join ' ', keys %Z::, "\n";     # ISA foo new                  #(N)

$zobj->bar();                        # Y's bar called               #(O)
print join ' ', keys %Z::, "\n";     # bar ISA foo new              #(P)
print join ' ', values %Z::, "\n";                                  #(Q)
                                     # *Z::bar *Z::ISA *Z::foo *Z::new
