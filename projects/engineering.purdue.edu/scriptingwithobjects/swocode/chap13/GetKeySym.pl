#!/usr/bin/perl -w

### GetKeySym.pl

use strict;
use Tk;

my $mw = MainWindow->new( -title => "Testing Callback" );            #(A)       

$mw->bind( '<KeyPress>' => \&get_key_info );                         #(B)

sub get_key_info {                                                   #(C)
#    my $w = $Tk::widget;                                            #(D)
#    my $e = $w->XEvent;                                             #(E)
    my $e = $Tk::event;                                              #(F)
    my ($key_sym_name, $key_num ) = ($e->K, $e->N);                  #(G)
    print "keysym=$key_sym_name, numeric=$key_num\n";                #(H)
}

MainLoop;                                                            #(I)
