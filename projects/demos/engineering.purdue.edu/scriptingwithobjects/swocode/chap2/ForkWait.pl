#!/usr/bin/perl -w

### ForkWait.pl

use strict;

my $child_pid = fork();                                            #(A)

die "Unable to fork: $!" unless defined $child_pid;                #(B)

if ($child_pid == 0) {                                             #(C)
    # Execute in child process only:
    print_processes( 'child ' );                                   #(D)
} else {                                                           #(E)
    # Execute in parent process only:
    sleep(2);                                                      #(F)
    print_processes( 'parent' );                                   #(G)
    my $zid = wait();                                              #(H)
    print_processes( 'parent' );                                   #(I)
    print "Returned by wait: $zid\n";                              #(J)
}

sub print_processes {                                              #(K)
    my ($child_or_parent) = @_;                                    #(L)
    my ($now) = (localtime =~ /(..:..:..)/);                       #(M)
    print "\n";                                           
    print map { "[$child_or_parent] [$now] [$$] $_" } `ps`;        #(N)
    print "\n"; 
}
