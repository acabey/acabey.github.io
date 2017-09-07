#!/usr/bin/perl
use strict;                                                            #(A)

# BasicSymRef.pl

#no strict 'refs';   

no strict;                                                             #(B)

my $x = "foo";                                                         #(C)
$$x = 100;                                                             #(D)
print $x, "\n";                     # foo                              #(E)
print $foo, "\n";                   # 100                              #(F)
$foo = 200;                                                            #(G)
print $$x, "\n";                    # 200                              #(H)
$$x = 300;                                                             #(I)
print $foo, "\n";                   # 300                              #(J)

$x = "bar";                                                            #(K)
@$x = ('a', 'b', 'c');                                                 #(L)
print $x, "\n";                     # bar                              #(M)
print "@bar\n";                     # a b c                            #(N)
$bar[3] = 'd';                                                         #(O)
print "@$x\n";                      # a b c d                          #(P)
$$x[4] = 'e';                                                          #(Q)
print "@bar\n";                     # a b c d e                        #(R)

my $foo = 10000;                                                       #(S)
print $foo, "\n";                   # 10000                            #(T)
print $main::foo, "\n";             # 300                              #(U)

my @bar = ('one', 'two', 'three');                                     #(V)
print "@bar\n";                     # one two three                    #(W)
print "@main::bar\n";               # a b c d e                        #(X)
