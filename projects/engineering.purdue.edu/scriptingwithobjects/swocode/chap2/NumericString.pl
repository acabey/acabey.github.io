#!/usr/bin/perl -w

# NumericString.pl

$x = "123.4";                                                      #(A)
$y = $x + 8;                                                       #(B)
print $y, "\n";                            # 131.4                 #(C)

$z = $x . "hello";                                                 #(D)
print $z, "\n";                            # 123.4hello            #(E)

$w = $y . "jello";                                                 #(F)
print $w, "\n";                            # 131.4jello            #(G)

#my $a = $w + 8;                           # ERROR                 #(H)

$x = "1.23e100";                                                   #(I)
$y = "0.0000000003";                                               #(J)
$z = $x * $y;                                                      #(K)
print $z, "\n";                            # 3.69e+90              #(L)
