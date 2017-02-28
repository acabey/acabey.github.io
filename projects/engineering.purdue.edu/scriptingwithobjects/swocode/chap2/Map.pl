#!/usr/bin/perl

### Map.pl

my @arr = qw/ hello mellow yellow /;                               #(A)

my @new_list = map length $_, @arr;                                #(B)
print "@new_list\n";                  # 5 6 6                      #(C) 

@new_list = map s/(o)$/$1$1/, @arr;   # WRONG                      #(D)
print "@new_list\n";                  # 1                          #(E)
print @new_list . "\n";               # 3                          #(F)

@new_list = map {s/(w)$/$1ish/; $_;} @arr;                         #(G)
print "@new_list\n";                  # helloo mellowish yellowish #(H)

@new_list = map &modifier, @arr;                                   #(I)
print "@new_list\n";                  # hello mellow yellow        #(J)

sub modifier {                                                     #(K)
    s/o$|ish$//;                                                   #(L)
    $_;                                                            #(M)
}

#Invoking map in a scalar context
#returns the number of elements
#in the new list:
my $x = map length $_, @arr;          #                            #(N)
print "$x\n";                         # 3                          #(O)
