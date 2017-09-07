#!/usr/bin/perl -w

###  CascadingMenu.pl

use Tk;

my $mw = new MainWindow;                                             #(A)
my $txt = $mw->Scrolled( 'Text', -width => 50, -scrollbars => 'e' )  
             ->pack();                                               #(B)
my $mbar = $mw->Menu();                                              #(C)
$mw->configure( -menu => $mbar );                                    #(D)

# Two menubuttons for the menubar:

my $help = $mbar->cascade( -label => "Help",                         #(E)
                           -underline => 0,                          #(F)
                           -tearoff => 0 );                          #(G)

my $level_0 = $mbar->cascade( -label => "Level_0",                   #(H)
                              -underline => 0,                       #(I)
                              -tearoff => 1, );                      #(J)

# The menu for the 'Help' menubutton in the menubar:

$help->command( -label => "About",                                   #(K)
                 -command => sub { $txt->insert( 'end',              #(L)
      "Click on the Level_0 button to see a cascading menu" ) } );   #(M)

# The menu for the 'Level_0' menubutton in the menubar:

$level_0->command( -label => "Exit",                                 #(N)
                   -command => sub { exit } );                       #(O)

my $level_1 = $level_0->cascade( -label => "Level_1",                #(P)
                               -underline => 1,                      #(Q)
                               -tearoff => 1 );                      #(R)

my $level_2 = $level_1->cascade( -label => "Level_2",                #(S)
                               -underline => 2,                      #(T)
                               -tearoff => 1 );                      #(U)

my $level_3 = $level_2->cascade( -label => "Level_3",                #(V)
                               -underline => 3,                      #(W)
                               -tearoff => 1 );                      #(X)

my $level_4 = $level_3->cascade( -label => "Level_4",                #(Y)
                               -underline => 4,                      #(Z)
                               -tearoff => 1 );                      #(a)

$level_4->command( -label => "click here",                           #(b)
                  -command => sub { $txt->insert( 'end',             #(c)
                 "hello from the tail end of a cascaded menu\n" ) });#(d)
MainLoop;                                                            #(e)
