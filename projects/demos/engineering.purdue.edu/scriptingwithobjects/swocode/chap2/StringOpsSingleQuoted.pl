#!/usr/bin/perl -w

### StringOps.pl

#Concatenation operation:
$str = 'he' . 'llo';                                               #(A)
print $str, "\n";                         # hello            
$str = 'he' . 'llo' . ' THERE';                                    #(B)
print $str, "\n";                         # hello THERE     
$str .= "!\n";                                                     #(C)
print $str;                               # hello THERE!    


#Uppercasing a string:
print uc( $str );                         # HELLO THERE!           #(D)

#Lowercasing a string:
print lc( $str );                         # hello there!           #(E)

#Finding the length:
print length($str), "\n";                 # 13                     #(F)
$x = 123.456;                                                      #(G)
print length($x), "\n";                   # 7                      #(H)

#Replicating a string:
print 'ab_' x 5, "\n";                    # ab_ab_ab_ab_ab_        #(I)

#Extracting substrings:
print substr('hello there', 6), "\n";     # there                  #(J)
print substr('hello there', -5), "\n";    # there                  #(K)
print substr('hello there', 6, 3), "\n";  # the                    #(L)
print substr('hello there', -5, 3), "\n"; # the                    #(M)

#Locating the first occurrence
#of a substring:
print index('hello there', 'lo'), "\n";   # 3                      #(N)
print index('hello there', 'e', 6), "\n"; # 8                      #(O)

#Set output record separator:
$\ = "\n";                                                         #(P)

#Using a format string to
#construct a new string:
$str = sprintf 'he%s the%s a %d times', 'llo', 're', 10;           #(Q)
print $str;                               # hello there a 10 times 

#Create a string by packing 
#data into a template:
$str = pack( 'a5 I2', 'hello there', 555819297, 589505315 );       #(R)
print length( $str );                    # 13                      #(S)
print $str;                              # hello!!!!####           #(T)

#Extract the data from a 
#string produced by pack():
($s1, $num1, $num2) = unpack( 'a5 I2', $str );                     #(U)
print $s1;                               # hello                   
print $num1;                             # 555819297               
print $num2;                             # 589505315               
