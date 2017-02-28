#!/usr/bin/perl -w

###  MenuRadOptCheck.pl

use Tk;

my $mw = new MainWindow;                                             #(A)
my $txt = $mw->Scrolled( 'Text', -width => 50 )->pack();             #(B)
my $mbar = $mw->Menu();                                              #(C)
$mw->configure( -menu => $mbar );                                    #(D)

# A menu consisting of radio buttons:

my $radio_select = $mbar->cascade( -label => "Choose_Color" );       #(E)
my $var;                                                             #(F)
$radio_select->radiobutton( -label => 'red',                         #(G)
                            -value => 'red',                         #(H)
                            -variable => \$var,                      #(I)
                            -command => \&radio_set_bg,              #(J)
                          );
$radio_select->radiobutton( -label => 'green',                       #(K)
                            -value => 'green',                  
                            -variable => \$var,                 
                            -command => \&radio_set_bg,         
                          );
$radio_select->radiobutton( -label => 'blue',                        #(L)
                            -value => 'blue',             
                            -variable => \$var,           
                            -command => \&radio_set_bg,   
                          );
$radio_select->radiobutton( -label => 'white',                       #(M)
                            -value => 'white',          
                            -variable => \$var,         
                            -command => \&radio_set_bg, 
                          );

# A menu consisting of check buttons: 

my ($var1, $var2, $var3) = (0, 0, 0);                                #(N)
my $check_select = $mbar->cascade( -label => "Choose_Numbers" );     #(O)
$check_select->checkbutton( -label => 'one',                         #(P)
                            -onvalue => 1,                           #(Q)
                            -offvalue => 0,                          #(R)
                            -variable => \$var1,                     #(S)
                            -command => \&print_nums,                #(T)
                          );
$check_select->checkbutton( -label => 'two',                         #(U)
                            -onvalue => 2,                   
                            -offvalue => 0,
                            -variable => \$var2,             
                            -command => \&print_nums,        
                          );
$check_select->checkbutton( -label => 'three',                       #(V)
                            -onvalue => 3,                    
                            -offvalue => 0,
                            -variable => \$var3,              
                            -command => \&print_nums,         
                          );

# An option menu:

my $color_option;                                                    #(W)
$mw->Optionmenu( -variable => \$color_option,                        #(X)
                 -options => ['cyan', 'yellow', 'magenta'],          #(Y)
                 -command =>                                         #(Z)
                 sub {$mw->configure(-background => $color_option)}  #(a)
               )->pack();                                            #(b)

MainLoop;                                                            #(c)

sub radio_set_bg {                                                   #(d)
    $txt->configure( -background => $var );                          #(e)
    $txt->insert('end', "value of \$var: $var\n");                   #(f)
}

sub print_nums {                                                     #(g)
    $txt->insert( 'end', "\$var1=$var1  \$var2=$var2 \$var3=$var3\n");
}
