#!/usr/bin/perl -w
use strict;

#  HashRef.pl

# Basics:
my %hash = (d => 1, b => 2);                                           #(A)

# Taking a reference to a hash
my $ref = \%hash;                                                      #(B)

# Dereferencing with % to retrieve an entire hash:
printhash(%$ref);               # b => 2  d => 1                       #(C)
printhash(%{$ref});             # b => 2  d => 1                       #(D)

# Dereferencing with $ to retrieve a single value:
print "$$ref{b}\n";             # 2                                    #(E)
print "${$ref}{b}\n";           # 2                                    #(F)
$$ref{c} = 'three';                                                    #(G)
printhash(%hash);               # b => 2  c => three  d => 1  

# The arrow notation for dereferencing:
my $p = $ref->{b};                                                     #(H)
print "$p\n";                   # 2                                    

# Using a reference for a value
$$ref{c} = ['hello', 'yello', 'mello'];                                #(I)
printhash(%hash);               # b => 2  c => ARRAY(0x805705c)  d => 1

# Using a reference for a key
my $refkey = ['holly', 'dolly'];                                       #(J)
$$ref{$refkey} = 'ly_sounds';                                          #(K)
printhash(%hash);               # ARRAY(0x805e2b8) => ly_sounds  b => 2  
                                # c => ARRAY(0x805705c)  d => 1
# The keys() function:
my @keys = keys %hash;                                                 #(L)
print "@keys\n";                # b c ARRAY(0x805e44c) d
@keys = keys %$ref;                                                    #(M)
print "@keys\n";                # b c ARRAY(0x805e44c) d
@keys = keys %{$ref};                                                  #(N)
print "@keys\n";                # b c ARRAY(0x805e44c) d

# The values() function:
my @values = values %hash;                                             #(O)
print "@values\n";              # 2 ARRAY(0x805705c) ly_sounds 1
@values = values %$ref;                                                #(P)
print "@values\n";              # 2 ARRAY(0x805705c) ly_sounds 1
@values = values %{$ref};                                              #(Q)
print "@values\n";              # 2 ARRAY(0x805705c) ly_sounds 1

# The delete() function:
delete $hash{$refkey};                                                 #(R)
delete $hash{c};                                                       #(S)
printhash( %hash );             # b => 2  d => 1                      
delete $ref->{b};                                                      #(T)
printhash( %hash );             # d => 1                              


sub printhash {                                                        #(U)
    my %h = @_;                                                        #(V)
    while ( (my $key, my $value) = each %h ) {                         #(W)
        print "$key => $value  ";                                      #(X)
    }
    print "\n";
}
