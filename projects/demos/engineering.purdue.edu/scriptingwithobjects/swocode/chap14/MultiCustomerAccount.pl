#!/usr/bin/perl -w

###  MultiCustomerAccount.pl

use strict;
use threads;                    
use threads::shared;            

my $account_balance : shared = 0;                                    #(A)
my $cv : shared;                                                     #(B)

foreach (1 .. 3) {                                                   #(C)
    threads->new( \&multiple_deposits );                             #(D)
}
foreach (1 .. 3) {                                                   #(E)
    threads->new( \&multiple_withdrawals );                          #(F)
}

foreach (threads->list) { $_->join }                                 #(G)

sub deposit {                                                        #(H)
    my $dep = shift;                                                 #(I)
    lock( $cv );                                                     #(J)
    $account_balance += $dep;                                        #(K)
    cond_signal( $cv );                                              #(L)
}

sub withdraw {                                                       #(M)
    my $draw = shift;                                                #(N)
    lock( $cv );                                                     #(O)
    while ( $account_balance < $draw ) {                             #(P)
        cond_wait( $cv );                                            #(Q)
    }                            
    $account_balance -= $draw;                                       #(R)
}

sub multiple_deposits {                                              #(S)
    my $i = 0;                                                       #(T)
    my $x;                                                           #(U)
    while ( 1 ) {                                                    #(V)
        $x = rand( 10 );                                             #(W)
        deposit( $x );                                               #(X)
        if ( $i++ % 10 == 0 ) {                                      #(Y)
            my $threadid = threads->self->tid;                       #(Z)
            printf( 
              "balance after $i deposits by thread $threadid: \t\t%d\n", 
                               $account_balance );                   #(a)
        }
        keepBusy( 1 );                                               #(b)
    }
}

sub multiple_withdrawals {                                           #(c)
    my $i = 0;                                                       #(d)
    my $x;                                                           #(e)
    while ( 1 ) {                                                    #(f)
        $x = rand( 10 );                                             #(g)
        withdraw( $x );                                              #(h)
        if ( $i++ % 10 == 0 )  {                                     #(i)
            my $threadid = threads->self->tid;                       #(j)
            printf( 
            "balance after $i withdrawals by thread $threadid: \t%d\n", 
                                   $account_balance );               #(k)
        }
        keepBusy( 1 );                                               #(l)
    }
}

sub keepBusy {                                                       #(m)
    my $how_many_seconds = shift;                                    #(n)
    my $curr = time;                                                 #(o)
    while ( time < $curr + $how_many_seconds ) {}                    #(p)
}
