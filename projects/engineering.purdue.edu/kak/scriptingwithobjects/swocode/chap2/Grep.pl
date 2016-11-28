#!/usr/bin/perl

### Grep.pl

my @arr = qw/ hello mellow jelloh yellow pillow bello /;           #(A)

my @selections = grep /w$/, @arr;                                  #(B)
print "@selections\n";                  # mellow yellow pillow     #(C)

@selections = grep &selector, @arr;                                #(D)
print "@selections\n";                  # mellow yellow pillow     #(E)

sub selector {                                                     #(F)
    /.*w$/;                                                        #(G)
}

@selections = grep { length( $_ ) == 5 } @arr;                     #(H)
print "@selections\n";                  # hello bello              #(I)

@selections = grep {                                               #(J)
                       print "hi ";                                #(K)
                       length( $_ ) == 5;                          #(L)
                   } @arr;                                         #(M)
                                        # hi hi hi hi hi hi        #(N)
print "\n@selections\n";                # hello bello              #(O)


# Invoking grep in a scalar context returns just the 
# number of items matched:
my $x = grep /w$/, @arr;                                           #(P)
print "$x\n";                           # 3                        #(Q)
