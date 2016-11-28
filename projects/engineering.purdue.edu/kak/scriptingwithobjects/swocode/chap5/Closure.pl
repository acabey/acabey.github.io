#!/usr/bin/perl -w
use strict;

# Closure.pl

sub make_greeting_generator {                                         #(A)
    my $greeting_target = shift;                                      #(B)
    sub {                                                             #(C)
        my $salutation = shift;                                       #(D)
        print "$salutation $greeting_target\n";                       #(E)
    };
};

my $greeting_gen1 = make_greeting_generator( "world" );               #(F)
my $greeting_gen2 = make_greeting_generator( "everyone" );            #(G)


$greeting_gen1->("hello");             # hello world                  #(H)
$greeting_gen1->("good morning");      # good morning world           #(I)
$greeting_gen2->("hello");             # hello everyone               #(J)
$greeting_gen2->("good morning");      # good morning everyone        #(K)

&$greeting_gen1("hello");              # hello world                  #(L)
&$greeting_gen2("good morning");       # good morning everyone        #(M)

&{make_greeting_generator("world")}("hello");                         #(N)
                                       # hello world
&{make_greeting_generator("everyone")}("good morning");               #(O)
                                       # good morning everyone
