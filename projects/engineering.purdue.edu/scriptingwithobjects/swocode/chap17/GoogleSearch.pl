#!/usr/bin/perl -w

### GoogleSearch.pl

use SOAP::Lite;                                                      #(A)

my $key = 'yMBej/tQFHI0CZSHXXSxYzWgdDc1F1We';                        #(B)

my $query = join ' ', @ARGV;                                         #(C)
die "need something to search for\n" unless $query;                  #(D)

my $googleSearch = SOAP::Lite->service( "file:GoogleSearch.wsdl");   #(E)

my $result = $googleSearch->doGoogleSearch(                          #(F)
               $key,           # key supplied by Google              #(G)
               $query,         # the query string                    #(H)
               0,              # start index for retrieved items     #(I)
               10,             # max num (< 10) of items             #(J)
               "false",        # deactivate filtering of duplicates  #(K)
               "",             # no country restriction              #(L)
               "false",        # deactivate 'safe search'            #(M)
               "",             # no language restriction             #(N)
               "",             # input encoding  (ignored)           #(O)
               "");            # output encoding (ignored)           #(P)
print "$result\n";                                                   #(Q)

if (%$result) {                                                      #(R)
    while ( my ($key, $val) = each %$result ) {                      #(S)
        print "$key   =>   $val\n";                                  #(T)
    }
    my @resultArray = @{$result->{resultElements}};                  #(U)
    print "@resultArray\n\n";                                        #(V)

    foreach my $result ( @resultArray ) {                            #(W)
        print                                                        #(X)
          join "\n",                                                 #(Y)
            $result->{title} || "no title",                          #(Z)
            $result->{URL},                                          #(a)
            $result->{snippet} || "no snippet",                      #(b)
            "\n";                                  
    }
}
