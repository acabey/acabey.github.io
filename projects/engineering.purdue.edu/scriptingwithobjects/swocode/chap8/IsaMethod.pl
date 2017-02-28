#!/usr/bin/perl -w
use strict;

### IsaMethod.pl

use Manager;                                                        #(A)

#--------------------------  Test Code  -------------------------------
my $man = Manager->new( "Trillian", "manager", "sales" );           #(B)

print $man->isa( 'UNIVERSAL' )  ? "yes\n" : "no\n";     # yes       #(C)
print $man->isa( 'Manager' )    ? "yes\n" : "no\n";     # yes       #(D)
print $man->isa( 'Employee' )   ? "yes\n" : "no\n";     # yes       #(E)
print $man->isa( 'Executive' )  ? "yes\n" : "no\n";     # no        #(F)
print Manager->isa('UNIVERSAL') ? "yes\n" : "no\n";     # yes       #(G)
print Manager->isa('Employee')  ? "yes\n" : "no\n";     # yes       #(H)

@Manager::ISA = ();                                                 #(I)

print $man->isa( 'UNIVERSAL' )  ? "yes\n" : "no\n";     # yes       #(J)
print $man->isa( 'Manager' )    ? "yes\n" : "no\n";     # yes       #(K)
print $man->isa( 'Employee' )   ? "yes\n" : "no\n";     # no        #(L)
print $man->isa( 'Executive' )  ? "yes\n" : "no\n";     # no        #(M)
print Manager->isa('UNIVERSAL') ? "yes\n" : "no\n";     # yes       #(N)
print Manager->isa('Employee')  ? "yes\n" : "no\n";     # no        #(O)
