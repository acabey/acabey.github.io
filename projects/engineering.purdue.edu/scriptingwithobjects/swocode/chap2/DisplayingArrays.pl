#!/usr/bin/perl -w

### DisplayingArrays.pl

use strict;       

my @arr = ('one', 'two', 'three', 'four');                          #(A)

print "@arr\n";           # one two three four                      #(B)

print @arr;               # onetwothreefour                         #(C)
print "\n";                                                         #(D)

print @arr . "\n";        # 4                                       #(E)

print "$arr[1]\n";        # two                                     #(F)

print $#arr. "\n";        # 3                                       #(G)

$#arr = 9;                # expand the array to 10 elements         #(H)

# For printing out the contents of the expanded array:
foreach ( @arr ) {                                                  #(I)
    if ( defined ) {                                                #(J)
        print $_ . " ";                                             #(K)
    } else {                                                        #(L)
        print "undef ";                                             #(M)
    }
}       #  one two three four undef undef undef undef undef undef   #(N)

print "\n";

# Another way to print out the contents of the expanded array:
for my $i ( 0..$#arr ) {                                            #(O)
    if ( defined( $arr[$i] ) ) {                                    #(P)
        print $arr[$i] . " ";                                       #(Q)
    } else {                                                        #(R)
        print "undef ";                                             #(S)
    }
}       #  one two three four undef undef undef undef undef undef   #(T)

print "\n";

# print $arr[7];                    # WARNING                       #(U)

# print "@arr\n";                   # WARNING                       #(V)

#Sorting experiments:

@arr = (94, 7, 34, 87, 5);                                          #(W)
my @sorted = sort @arr;                                             #(X)
print "@sorted\n";                  # 34 5 7 87 94                  #(Y)

@sorted = sort {$a <=> $b} @arr;                                    #(Z)
print "@sorted\n";                  # 5 7 34 87 94                  #(a)

@sorted = sort {$b <=> $a} @arr;                                    #(b)
print "@sorted\n";                  # 94 87 34 7 5                  #(c)

@arr = ("hello", "JELLO", "hELLO", "JELlo", "yello");               #(d)
my @sorted = sort @arr;                                             #(e)
print "@sorted\n";                  # JELLO JELlo hELLO hello yello #(f)

@sorted = sort {$a cmp $b} @arr;                                    #(g)
print "@sorted\n";                  # JELLO JELlo hELLO hello yello #(h)

@sorted = sort {"\L$a" cmp "\L$b"} @arr;                            #(i)
print "@sorted\n";                  # hello hELLO JELLO JELlo yello #(j)

@sorted = sort {"\U$a" cmp "\U$b"} @arr;                            #(k)
print "@sorted\n";                  # hello hELLO JELLO JELlo yello #(l)
