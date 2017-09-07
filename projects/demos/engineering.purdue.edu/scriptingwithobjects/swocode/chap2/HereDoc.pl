#!/usr/bin/perl -w

### HereDoc.pl

use strict;

#                               EXAMPLE 1

my $res = joiner( <<END );                                           #(A)
hello jello mello 
pillow yellow 
END
print $res, "\n";             # hello jello mello pillow yellow      #(B)



#                               EXAMPLE 2

$res = mingler( <<END1, <<END2 );                                    #(C)
abra babra cabra dabra
libra zebra 
END1
kiki  
yucky 
ziki
END2
print $res, "\n";                                                    #(D)
          # abra kiki babra yucky cabra ziki dabra  libra  zebra


#                               EXAMPLE 3

use English;                                                         #(E)

formline <<END, "hello", "jello", "melloyellow";                     #(F)
        @<<<  @|||  @>>>
END
print "$ACCUMULATOR\n";          #         hell  jell  mell          #(G)
$ACCUMULATOR = "";                                                   #(H)



#                               EXAMPLE 4

my $item1 = "silly";                                                 #(I)
my $item2 = "hillbilly";                                             #(J)
my $fmt = '      @<<<<      @>>>>>>>>>';                             #(K)
formline($fmt, $item1, $item2);                                      #(L)
print $ACCUMULATOR, "\n";        #      silly       hillbilly        #(M)
$ACCUMULATOR = "";                                                   #(N)



#                               EXAMPLE 5

print <<ENDHEADER;                                                   #(O)
<HEAD><TITLE>My Guestbook</TITLE></HEAD>
<BODY bgcolor=dcdcdc>                                    
<CENTER>
<H1>My GUESTBOOK</H1>
<A HREF=guestbook.cgi>[Post a message]</A>
</CENTER>
<H2>Prior Messages</H2>
ENDHEADER
                 # output: exactly as it appears in the              #(P)
                 #         "here document" above


#                               EXAMPLE 6

my $str = << 'END';                                                  #(Q)
ls -al
END
print $str, "\n";                # ls -al                            #(R)



#                               EXAMPLE 7

$str = << `END`;                                                     #(S)
ls -al
END
print $str, "\n";                                                    #(T)
                  # output: a listing of the items in your  
                  #         current directory



#                               EXAMPLE 8

($str = <<END)  =~ s/hello/jello/g;                                  #(U)
  one hello is like another hello
END
print $str, "\n";             # one jello is like another jello      #(V)


#---------------------- Subroutines used above -----------------------

sub joiner {                                                         #(W)
#    my @words = split( ' ', join( ' ', @_ ) );
    return "@{[ split( ' ', join( ' ', @_ ) ) ]}";
#    return "@words";
}

sub mingler {                                                        #(X)
    my @arr1 = split ' ', shift;
    my @arr2 = split ' ', shift;
    my $mingled;
    my $i = 0;
    while ($i <= (($#arr1 > $#arr2) ? $#arr1 : $#arr2) ) {
        $mingled .= ($arr1[$i] or "")
                    . ' ' 
                    . ($arr2[$i++] or "")
                    . ' ';
    }
    return $mingled;
}
