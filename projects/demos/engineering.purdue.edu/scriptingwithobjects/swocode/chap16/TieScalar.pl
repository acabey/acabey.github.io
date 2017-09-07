#!/usr/bin/perl -w
use strict;

###  TieScalar.pl

#---------------------------   class X   ---------------------------------
package X;                                                           #(A)

    sub TIESCALAR {                                                  #(B)
        my ( $class, $bias ) = @_;                                   #(C)
        bless { bias => $bias,                                       #(D)
                true_val => $bias                                    #(E)
              }, $class;                                             #(F)
    }
    sub true_value {                                                 #(G)
        my $ref = shift;                                             #(H)
        @_ ? $ref->{true_val} = shift                                #(I)
           : $ref->{true_val};                                       #(J)
    }
    sub get_bias {                                                   #(K)
        my $ref = shift;                                             #(L)
        $ref->{bias};                                                #(M)
    }
    sub FETCH {                                                      #(N)
        my $ref = shift;                                             #(O)
        return $ref->{true_val};                                     #(P)
    }
    sub STORE {                                                      #(Q)
        my $ref = shift;                                             #(R)
        $ref->{true_val} = $ref->{bias} + shift;                     #(S)
    }
    sub DESTROY {                                                    #(T)
        my $ref = shift;                                             #(U)
        my $true_val = $ref->true_value();                           #(V)
        print "An X object of datum $true_val " . 
                                   "about to be destroyed\n";        #(W)
    }

#---------------------------   main   -------------------------------------

package main;                                                        #(X)

my $xobj = tie my $x, 'X', (500);                                    #(Y)

$x = 100;                                                            #(Z)
print "$x\n";                   # 600                                #(a)
$x = 200;                                                            #(b)
print "$x\n";                   # 700                                #(c)

tie my $y, 'X', (1000);                                              #(d)
my $z = $x + $y;                # but $z has no magic                #(e)
print "$z\n";                   # 1700                               #(f)

print tied( $x ), "\n";         # X=HASH(0x804ccf4)                  #(g)
print tied( $y ), "\n";         # X=HASH(0x806d248)                  #(h)
#print tied( $z ), "\n";        # ERROR                              #(i)

#print ref( $x );               # ERROR                              #(j)
print ref( $xobj ), "\n";       # X                                  #(k)

my $ref = tied( $x );                                                #(l)
print $ref->get_bias, "\n";     # 500                                #(m)
print $xobj->get_bias, "\n";    # 500                                #(n)

$xobj = undef;                  # X's destructor NOT called          #(o)
$x = 300;                       # $x still has magic                 #(p)
print "$x\n";                   # 800                                #(q)
untie $x;                       # X's destructor called              #(r)
      # output: "An X object of datum 800 is about to be destroyed"
print "$x\n";                   # 800                                #(s)
$x = 300;                       # $x no longer has magic             #(t)
print "$x\n";                   # 300                                #(u)

$xobj = X->TIESCALAR(500);                                           #(v)
print ref( $xobj ), "\n";       # X                                  #(w)
print $xobj->get_bias, "\n";    # 500                                #(x)
