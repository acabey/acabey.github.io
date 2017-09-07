#!/usr/bin/perl -w

###  DrawArt.pl

use strict;
use Tk;

my $mw = MainWindow->new;                                            #(A)
$mw->configure( -title => "Art Nouveau",                             #(B)
                -height => 650,                                      #(C)
                -width => 600 );                                     #(D)
$mw->resizable( 0, 0 );                                              #(E)

my $canvas = $mw->Canvas( -height => 600,                            #(F)
                          -width => 600,                             #(G)
                          -cursor => "crosshair"                     #(H)
                        )->pack( -side => 'top' );                   #(I)

my $frame = $mw->Frame->pack( 'side' => 'bottom' );                  #(J)
$frame->Button( -text => 'Save',                                     #(K)
                -command =>                                             
                   sub {$canvas->postscript( -file => "picture.ps")} #(L)
              )->pack( -side => 'left' );                            #(M)
$frame->Button( -text => 'Exit',                                     #(N)
                -command => sub { exit }                             #(O)
              )->pack( -side => 'right' );                           #(P)

$canvas->CanvasBind( "<Button-1>",                              
                         [\&drawingControl, Ev('x'), Ev('y')] );     #(Q)

my $drawEnable;                                                      #(R)
my ($startX, $startY);                                               #(S)

# Turn drawing on and off with consecutive clicks of the
# left button of the mouse
sub drawingControl {                                                 #(T)
    $drawEnable = ++$drawEnable % 2;                                 #(U)
    unless ($drawEnable) {                                           #(V)
        $canvas->CanvasBind( "<Motion>", "" );                       #(W)
    } else {                                                         #(X)
        my $canv = shift;                                            #(Y)
        ($startX, $startY) = @_;                                     #(Z)
        print "Button pressed at: x=$startX  y=$startY\n";           #(a)
        $canv->CanvasBind("<Motion>", [\&draw, Ev('x'), Ev('y')]);   #(b)
    }
}

sub draw {                                                           #(c)
    my ($canv, $x, $y) = @_;                                         #(d)
    $canv->createArc( $startX, $startY, $x, $y,                    
                               -width => 4, -fill => 'red' );        #(e)
    ($startX, $startY) = ($x, $y);                                   #(f)
}

MainLoop;                                                            #(g)
