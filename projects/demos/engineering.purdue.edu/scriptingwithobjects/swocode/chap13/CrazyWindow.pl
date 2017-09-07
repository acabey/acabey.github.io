#!/usr/bin/perl -w

###  CrazyWindow.pl

use strict;
use Tk;

my $mw = MainWindow->new( -title => "CrazyWindow" );                 #(A)

my $textWindow = $mw->Scrolled( 'Text',                              #(B)
                                -width => 45,                        #(C)
                                -scrollbars => 'e',                  #(D)
                                -setgrid => 'true',                  #(E)
                              )
                    ->pack( -side => 'left' );                       #(F)

my $drawWindow = $mw->Canvas()                                       #(G)
                ->pack( -side => 'right',                            #(H)
                        -fill => 'y', -expand => 1 );                #(I)

$textWindow->focus;                                                  #(J)

$textWindow->bind( '<KeyPress>' => \&word_accumulator);              #(K)

my $word = '';                                                       #(L)

sub word_accumulator {                                               #(M)
    my $e = $Tk::event;                                              #(N)
    my ($keysym_text, $keysym_decimal ) = ($e->K, $e->N);            #(O)
    if ( $keysym_text ne 'space' and $keysym_text ne 'Return' ) {    #(P)
        $word .= $keysym_text;                                       #(Q)
    } else {                                                         #(R)
        my ($x, $y) = (int(rand(280)), int(rand(300)));              #(S)
        if ( $word eq 'red' ) {                                      #(T)
            $drawWindow->createRectangle( $x, $y, $x+30, $y+30, 
                                  -fill => 'red' );                  #(U)
        } elsif ( $word eq 'blue' ) {                                #(V)
            $drawWindow->createRectangle( $x, $y, $x+30, $y+30,  
                                  -fill => 'blue' );               
        } elsif ( $word eq 'brown' ) {                             
            $drawWindow->createRectangle( $x, $y, $x+30, $y+30, 
                                  -fill => 'brown' );              
        } elsif ( $word eq 'green' ) {                             
            $drawWindow->createRectangle( $x, $y, $x+30, $y+30,  
                                  -fill => 'green' );              
        } elsif ( $word eq 'black' ) {                             
            $drawWindow->createRectangle( $x, $y, $x+30, $y+30, 
                                  -fill => 'black' );              
        } elsif ( $word eq 'orange' ) {                            
            $drawWindow->createRectangle( $x, $y, $x+30, $y+30, 
                                  -fill => 'orange' );             
        } elsif ( $word eq 'yellow' ) {                            
            $drawWindow->createRectangle( $x, $y, $x+30, $y+30, 
                                  -fill => 'yellow' );             
        }
        $word = '';                                                  #(W)
    }
}

MainLoop;                                                            #(X)
