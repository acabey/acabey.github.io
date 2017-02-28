#!/usr/bin/perl -w

### PerformanceWithThreads.pl

use Time::HiRes qw( gettimeofday tv_interval );                      #(A)
use Statistics::Descriptive;                                         #(B)
use File::Temp ("tempfile");                                         #(C)
use threads;                                                         #(D)
use strict;                                                          #(E)

my $threads = 2;                                                     #(F)
my $iterations = 100;                                                #(G)
#my $iterations = 5;
my (undef, $statfile) = tempfile();                                  #(H)
open( FH, ">>$statfile" );                                           #(I)

my $lock;

for (1 .. $threads) {                                                #(J)
    threads->create( \&do_it );                                      #(K)
}
foreach (threads->list) {                                            #(L)
    $_->join;                                                        #(M)
}

sub do_it {                                                          #(N)
    for (1 .. $iterations ) {                                        #(O)
        lock( $lock );                                               #(P)
        my $t0 = [gettimeofday()];                                   #(Q)
        # start transaction
        for (1 .. 1000) {                                            #(R)
            my $res = sqrt( 123456789012345 );                       #(S)
        }                                    
        # end transaction
        my $elapsed = tv_interval( $t0 );                            #(T)
        print FH $elapsed . "\n";                                    #(U)
#        print "$elapsed  ";                                         #(V)
    }
}

close FH;                                                            #(W)
sleep( 5 );                                                          #(X)
analyzeStats();                                                      #(Y)

sub analyzeStats {                                                   #(Z)
    print "\n\nAnalysing stats from data in $statfile: \n";          #(a)
    open( FH, "$statfile" );                                         #(b)
    chomp( my @data = <FH> );                                        #(c)
    if (@data) {                                                     #(d)
        my $stat = Statistics::Descriptive::Full->new();             #(e)
        $stat->add_data( @data );                                    #(f)
        print "Count:    ", $stat->count() . "\n";                   #(g)
        print "Mean:     ", $stat->mean() . " secs\n";               #(h)
        print "StdDev:   ", $stat->standard_deviation()." secs\n";   #(i)
        print "Median:   ", $stat->median() . " secs\n";             #(j)
        print "Minimum:  ", $stat->min() . " secs\n";                #(k)
        print "Maximum:  ", $stat->max() . " secs\n\n\n";            #(l)
        my %hist = $stat->frequency_distribution( 20 );              #(m)
        for (sort {$a <=> $b} keys %hist) {                          #(n)
            print "bin = $_, count = $hist{$_}\n";                   #(o)
        }            
    } else {                                                         #(p)
        print "There appears to be no data.\n";                      #(q)
    }
}
