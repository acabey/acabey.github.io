#!/usr/bin/perl -w
use strict;

#  ScalarRef.pl

# Basics:
my $a = 10;                                                         #(A)
my $ra = \$a;                                                       #(B)
print ${$ra}, "\n";             # 10                                #(C)
print $$ra, "\n";               # 10                                #(D)
$a = 20;                                                            #(E)
print $$ra, "\n";               # 20                                #(F)

# Reference of a reference of a reference to a scalar:
$ra = \\\$a;                                                        #(G)
print $ra, "\n";                # SCALAR(0x804b5f8)                 #(H)
print $$ra, "\n";               # SCALAR(0x804b514)                 #(I)
print $$$ra,"\n";               # SCALAR(0x8057098)                 #(J)
print $$$$ra, "\n";             # 10                                #(K)
my $int_address = int( $ra );                                       #(L)
print $int_address, "\n";       # 134526456                         #(M)
my $s = sprintf "0x%x", $int_address;                               #(N)
print $s, "\n";                 # 0x804b5f8                         #(O)

# References to literals:
my $r1 = \100;                                                      #(P)
print $r1, "\n";                # SCALAR(0x805c10c)                 #(Q)
my $r2 = \100;                                                      #(R)
print $r2, "\n";                # SCALAR(0x805c154)                 #(S)
print $$r1, "\n";
print $$r2, "\n";

__END__

my $r3 = \"hello";                                                  #(T)
print $r3, "\n";                # SCALAR(0x805c1a8)                 #(U)
my $r4 = \"hello";                                                  #(V)
print $r4, "\n";                # SCALAR(0x805c1f0)                 #(W)

