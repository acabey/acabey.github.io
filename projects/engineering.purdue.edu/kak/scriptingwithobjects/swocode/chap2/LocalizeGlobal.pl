#!/usr/bin/perl -w
use strict;

# LocalizeGlobal.pl

# Example 1:

$main::x = 100;                                                       #(A)
{                                                                     #(B)
    local $main::x = 200;                                             #(C)
    print "$main::x\n";                     # 200                     #(D)
}                                                                     #(E)
print "$main::x\n";                         # 100                     #(F)


# Example 2:

my $file = "data.txt";                                                #(G)
my @all_words;                                                        #(H)
{                                                                     #(I)
    open FILE, $file                                                  #(J) 
        or die "Can't open $file: $!";                                #(K)
    local $/ = undef;                                                 #(L)
    @all_words = split ' ', <FILE>;                                   #(M)
    close FILE;                                                       #(N)
}                                                                     #(O)
print "@all_words\n";                                                 #(P)
                # A hungry dog jumped over a lazy blue-colored fish. 

open FILE, $file                                                      #(Q)
    or die "Can't open $file: $!";                                    #(R)
@all_words = split ' ', <FILE>;                                       #(S)
close FILE;                                                           #(T)
print "@all_words\n";                       # A hungry fox            #(U)


