# HelloModule4.pm

package HelloModule4;                                               #(A)

sub say_loud_hello {                                                #(B)
    print "HELLO!!! HOW ARE YOU!!!\n";
}

my $very_soft = sub {                                               #(C)
    print "hi sweet thing! how are you this morning!\n";
};

my $not_very_soft = sub {                                           #(D)
    print "hi dear! how are you this morning!\n";
};

sub say_soft_hello {                                                #(E)
    print "How soft?  Say 'very' or 'usual'  :";
    chomp( my $how_soft = <STDIN> );
    $how_soft =~ s/^\s*(\S*)\s*$/$1/;  
    if ( $how_soft eq 'very' ) {
        $very_soft->();                                             #(F)
    } elsif ( $how_soft eq 'usual' ) {
        $not_very_soft->();                                         #(G)
    } else {
        die "unrecognized answer\n";                                #(H)
    }
}

1
