#!/usr/bin/perl -w

###  GridGeom.pl

use strict;
use Tk;

my $mw = MainWindow->new( -title => "Grid Layout" );                 #(A)

# Widget for cell (0,0):
my $button = $mw->Button(                                            #(B)
                  -text => 'Click Here for a Greeting',              #(C)
                  -relief  =>    'raised',                           #(D)
                  -command =>  sub {                                 #(E)
                                 print "Good Morning to you!\n";     #(F)
                              }                                      
                  )->grid( -row => 0,                                #(G)
                           -column => 0,                             #(H)
                               -sticky => "nsew",                    #(Z)
                           -padx => 60,                              #(I)
                           -pady => 40 );                            #(J)


# Widget for cell (0,1):
my $entry_widget = $mw->Entry->grid( -row => 0,                      #(K)
                                     -column => 1,                   #(L)
                                     -padx => 60 );                  #(M)
$entry_widget->bind( '<Return>' => sub {                             #(N)
           my $input = $entry_widget->get . "\n";                    #(O)
           $entry_widget->delete( 0, 'end' );                        #(P)
           print "User entered in entry widget: $input\n";           #(Q)
       } );


# Widget for cell (1,0):
my $label = $mw->Label( text    =>    'hello',                       #(R)
                        anchor  =>    'c',                           #(S)
                        relief  =>    'groove',                      #(T)
                        width   =>    10,                            #(U)
                        height  =>    2,                             #(V)
                      )->grid( -row => 1,                            #(W)
                               -column => 0,                         #(X)
                               -pady => 40,                          #(Y)
                               -sticky => "nsew",                    #(Z)
                             );                                    


# Widget for cell (1,1):         
my $listbox = $mw->Scrolled( "Listbox",                              #(a)
                             -scrollbars => 'w',                     #(b)
                             -selectmode => 'single',                #(c)
                             -width => 10,                           #(d)
                             -height => 3,                           #(e)
                   )->grid( -row => 1, -column => 1 );               #(f)
$listbox->insert( 'end', 'red', 'green', 'blue', 'magenta', 'pink' );#(g)
$listbox->bind( '<Button-1>', sub { $listbox->configure(             #(h)
    -background => $listbox->get( $listbox->curselection() ) ) } );  #(i)

#$mw->gridRowconfigure(0, -weight => 1);
#$mw->gridColumnconfigure(0, -weight => 1);


MainLoop();                                                          #(j)
