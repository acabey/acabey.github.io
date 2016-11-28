#!/usr/bin/perl -w

# TypeglobAssign.pl

use strict;

#Assign values for the different
#usages of the name 'xvar':
$main::xvar = 10;                                                  #(A)
@main::xvar = (1, 2, 3, 4);                                        #(B)
%main::xvar = (a => 5, b => 6);                                    #(C)
open(main::xvar, "data.txt");                                      #(D)
sub main::xvar {                                                   #(E)
    print "hello\n";                                               #(F)
}                                                                  #(G)

#A typeglob alias for the 
#name 'xvar':
*main::yvar = *main::xvar;                                         #(H)

#Process 'yvar' as if it is 'xvar':
print "$main::yvar\n";                  # 10                       #(I)
my @arr = @main::yvar;                                             #(J)
print "@arr\n";                         # 1  2  3  4               #(K)
my @for_print = %main::yvar;                                       #(L)
print "@for_print\n";                   # a  5  b  6               #(M)
&main::yvar;                            # hello                    #(N)
my $string_from_file = <main::yvar>;                               #(O)
print "$string_from_file\n";            # A hungry dog             #(P)

#Name aliasing by typeglob 
#assignments can be localized:
$main::zvar = 100;                                                 #(Q)
{                                                                     
    local *main::zvar = *main::xvar;                               #(R)
    print "$main::zvar\n";              # 10                       #(S)
}                                                                    
print "$main::zvar\n";                  # 100                      #(T)

#"my" name hides global
#name:
no strict;                                                         #(U)
print "$xvar\n";                        # 10                       #(V)
my $xvar = 10000;                                                  #(W)
print "$xvar\n";                        # 10000                    #(X)
print "$main::xvar\n";                  # 10                       #(Y)
