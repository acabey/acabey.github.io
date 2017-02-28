#!/usr/bin/perl -w

### ForkBasic.pl

use strict;

my $child_pid = fork();                                            #(A)

die "Unable to fork: $!" unless defined $child_pid;                #(B)

my $str = "hello";                                                 #(C)

if ($child_pid == 0) {                                             #(D)
    # Execute in child process:
    print "I am the child process of PID $$\n\n";                  #(E)
    $str = "jello";                                                #(F)
} else {                                                           #(G)
    # Execute in parent process:
    sleep(1);                                                      #(H)
    print "      I am the parent process\n".                       #(I)
          "      My own PID is $$\n".                            
          "      My child's PID is $child_pid\n";

    print "      $str\n";              # hello                     #(J)
}
