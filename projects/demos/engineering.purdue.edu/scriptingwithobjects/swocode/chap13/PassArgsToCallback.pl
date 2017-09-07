#!/usr/bin/perl -w

###  PassArgsToCallbacks.pl

use strict;
use Tk;

my $mw = MainWindow->new();                                          #(A)
my $b1 = $mw->Button(-text => "b1")->grid(-row => 0, -column => 0);  #(B)
my $b2 = $mw->Button(-text => "b2")->grid(-row => 0, -column => 1);  #(C)
my $b3 = $mw->Button(-text => "b3")->grid(-row => 1, -column => 0);  #(D)
my $b4 = $mw->Button(-text => "b4")->grid(-row => 1, -column => 1);  #(E)
my $b5 = $mw->Button(-text => "b5")->grid(-row => 2, -column => 0);  #(F)
my $b6 = $mw->Button(-text => "b6")->grid(-row => 2, -column => 1);  #(G)
my $b7 = $mw->Button(-text => "b7")->grid(-row => 3, -column => 0);  #(H)
my $b8 = $mw->Button(-text => "b8")->grid(-row => 3, -column => 1);  #(I)

# For the buttons b1 through b4, the 
# callbacks need no arguments:

$b1->configure( -command => sub { print "b1 says hello to me\n" } ); #(J)
$b2->configure( -command => \&says_b2 );                             #(K)
$b3->bind( '<Button-1>', sub { print "b3 says hello to me\n" } );    #(L)
$b4->bind( '<Button-1>', \&says_b4 );                                #(M)

sub says_b2 { print "b2 says hello to me\n" }                        #(N)
sub says_b4 { print "b4 says hello to me\n" }                        #(O)


# The callbacks for b5, b6, b7, and b8 
# need the following two as arguments:

my $arg1 = "hello";                                                  #(P)
my $arg2 = "to me";                                                  #(Q)

$b5->configure( -command => [ \&saysomething_1, $arg1, $arg2 ] );    #(R)

$b6->configure( -command => [                                        #(S)
                              sub {                                  #(T)
                                my ($p, $q) = @_;                    #(U)
                                my $butt = $Tk::widget;              #(V)
                                my $butt_lbl = $butt->cget('-text'); #(W)
                                print "$butt_lbl says $p $q\n";      #(X)
                              },                                     #(Y)
                              $arg1,                                 #(Z)
                              $arg2                                  #(a)
                            ]                                        #(b)
              );                                                     #(c)

$b7->bind( '<Button-1>', [                                           #(d)
                           sub {                                     #(e)
                             my $butt = shift;                       #(f)
                             my $butt_lbl = $butt->cget( '-text' );  #(g)
                             my ($p, $q) = @_;                       #(h)
                             print "$butt_lbl says $p $q\n";         #(i)
                           },                                        #(j)
                           $arg1,                                    #(k)
                           $arg2                                     #(l)
                         ]                                           #(m)
         );                                                          #(n)

$b8->bind( '<Button-1>', [ \&saysomething_2, $arg1, $arg2 ] );       #(o)

MainLoop;                                                            #(p)

sub saysomething_1 {                                                 #(q)
    my ($p, $q) = @_;                                                #(r)
    my $widget = $Tk::widget;                                        #(s)
    my $butt_lbl = $widget->cget( '-text' );                         #(t)
    print "$butt_lbl says $p $q\n";                                  #(u)
}

sub saysomething_2 {                                                 #(v)
    my ($widget, $p, $q) = @_;                                       #(w)
    my $butt_lbl = $widget->cget( '-text' );                         #(x)
    print "$butt_lbl says $p $q\n";                                  #(y)
}
