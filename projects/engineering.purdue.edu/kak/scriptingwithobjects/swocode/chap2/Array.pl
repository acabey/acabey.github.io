#!/usr/bin/perl

### Array.pl

#Initialize array with a scalar:
@arr = 'a';                                                        #(A)
print "@arr\n";                           # a                      #(B)

#Initialize array with a list:
@arr = qw{0 1 two};                                                #(C)
print "$arr[2]\n";                        # two                    #(D)
print "@arr\n";                           # 0 1 two                #(E)
$size = @arr;                                                      #(F)
print "$size\n";                          # 3                      #(G)

#Extend the array:
$#arr = 4;                                                         #(H)

#The new array:
print "@arr\n";                           # 0 1 two                #(I)
$size = @arr;                                                      #(J)
print "$size\n";                          # 5                      #(K)

#Explicitly 'undef' the new 
#elements:
($arr[3], $arr[4]) = (undef, undef);                               #(L)
print "@arr\n";                           # 0 1 two                #(M)

#Try autovivification:
$arr[6] = 6;                                                       #(N)
print "@arr\n";                           # 0 1 two    6           #(O)
$size = @arr;                                                      #(P)
print "$size\n";                          # 7                      #(Q)

#Slice an array out of a 
#longer list:
($x, $y, @arr) = ( 1, 2, 'zero', 'one', 'two' );                   #(R)
print "@arr\n";                           # zero one two           #(S)

#A "funny" way to make an 
#array:
unshift @barr, 'hi';                                               #(T)
@barr = (@barr, @barr);                                            #(U)
print "@barr\n";                          # hi hi                  #(V)

#Insert a slice of one
#array into another:
@carr = (@barr, @arr[0,2]);                                        #(W)
print "@carr\n";                          # hi hi zero two         #(X)

#Use range operator for 
#slicing:
@carr = (@barr, @arr[0..2]);                                       #(Y)
print "@carr\n";                          # hi hi zero one two     #(Z)

#Switch elements:
print "@arr\n";                           # zero one two           #(a)
@arr[0,1] = @arr[1,0];                                             #(b)
print "@arr\n";                           # one zero two           #(c)

#The 'shift' operator
#extracts out the first
#element of the array:
$first = shift @arr;                                               #(d)
print "$first\n";                         # one                    #(e)
print "@arr\n";                           # zero two               #(f)
$size = @arr;                                                      #(g)
print "$size\n";                          # 2                      #(h)

#The 'unshift' operator
#pushes elements in at the 
#front end of the array:
@new_stuff = (0, 1);                                               #(i)
$x = unshift @arr, @new_stuff;                                     #(j)
print "$x\n";                             # 4                      #(k)
print "@arr\n";                           # 0 1 zero two           #(l)
$size = @arr;                                                      #(m)
print "$size\n";                          # 4                      #(n)

#A more common call 
#to unshift:
$x = unshift @arr, 'three';                                        #(o)
print "@arr\n";                           # three 0 1 zero two     #(p)
#$x = unshift qw/zero one/, 'three';      # WRONG                  #(q)


#The 'pop' operator works 
#at the back of the array:
$y = pop @arr;                                                     #(r)
print "$y\n";                             # two                    #(s)
print "@arr\n";                           # three 0 1 zero         #(t)
$size = @arr;                                                      #(u)
print "$size\n";                          # 4                      #(v)


#The 'push' operator works 
#at the back of the array:
@new_stuff = qw/a b/;                                              #(w)
$x = push @arr, @new_stuff;                                        #(x)
print "$x\n";                             # 6                      #(y)
print "@arr\n";                           # three 0 1 zero a b     #(z)
$size = @arr;                                                     #(za)
print "$size\n";                          # 6                     #(zb)

#A more common call to push:
push @arr, 'c';                                                   #(zc)
print "@arr\n";                           # three 0 1 zero a b c  #(zd)

#Reverse an array:
my @rev = reverse @arr;                                           #(ze)
print "@rev\n";                           # c b a zero 1 0 three  #(zf)

#Sort an array:
my @sorted = sort @rev;                                           #(zg)
print "@sorted\n";                        # 0 1 a b c three zero  #(zh)


#Experiments with splicing:

@arr = (0, 1, 2, 3, 4, 5, 6);                                     #(zi)
splice(@arr, 4);                                                  #(zj)
print "@arr\n";                           # 0 1 2 3               #(zk)

@arr = (0, 1, 2, 3, 4, 5, 6);                                     #(zl)
splice(@arr, 4, 2);                                               #(zm)
print "@arr\n";                           # 0 1 2 3 6             #(zn)

@arr = (0, 1, 2, 3, 4, 5, 6);                                     #(zo)
@brr = ('a', 'b', 'c');                                           #(zp)
splice(@arr, 4, 2, @brr);                                         #(zq)
print "@arr\n";                           # 0 1 2 3 a b c 6       #(zr)


#chomp invoked on an array 
#of strings:
@names = ( "peter\n", "paul", "mary\n" );                         #(zs)
chomp @names;                                                     #(zt)
print "@names\n";                         # peter paul mary       #(zu)
