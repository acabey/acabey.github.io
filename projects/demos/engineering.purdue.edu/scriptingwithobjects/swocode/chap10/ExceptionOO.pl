#!/usr/bin/perl -w
use strict;

# ExceptionOO.pl

use Exception qw(:all);                                             #(A)       

#--------------------  class AmountExceededException  -----------------
package AmountExceededException;                                    #(B)
@AmountExceededException::ISA = ('Exception');                      #(C)

#----------------------  class OverdraftException  --------------------
package OverdraftException;                                         #(D)
@OverdraftException::ISA = ('Exception');                           #(E)

#-------------------------  class BankAccount  ------------------------
package BankAccount;                                                #(F)

use Exception qw(:all);                                             #(G)

my $balance = 1000;                                                 #(H)

my $err1 = AmountExceededException->new( 'amount_exceeded',         #(I)
                   'You have exceeded the limit on a '. 
                   'single withdrawal by requesting' );              
my $err2 = OverdraftException->new( 'overdrafted',                  #(J)
                   'There is insufficient balance in '.
                   'your account. You wanted to withdraw');

sub withdraw_money {                                                #(K)
    my $amount = shift;                                             #(L)
    if ( $amount > 200 and $amount < $balance ) {                   #(M)
        $err1->raise( "an amount of $amount." );                    #(N)
    } elsif ( $amount > $balance ) {                                #(O)
        $err2->raise( "an amount of $amount." );                    #(P)
    }
    $balance = $balance - $amount;                                  #(Q)
    print "New balance is $balance\n";                              #(R)
}

while (1) {                                                         #(S)
    try {                                                           #(T)
        print "How much do you need? "; chomp(my $amount = <STDIN>);#(U)
        withdraw_money( $amount );                                  #(V)
    } when $err1, except {                                          #(W)
        shift->confess;                                             #(X)
    } when 'overdrafted', except {                                  #(Y)
        shift->croak;                                               #(Z)
    }
};
