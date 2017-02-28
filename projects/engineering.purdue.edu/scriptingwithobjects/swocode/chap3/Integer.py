#!/usr/bin/env python

### Integer.py

# Since Python uses C's long for plain integers, this will
# typically NOT be the largest value for a plain integer:
num = 0x7fffffff                                                   #(A)
print num                        # 2147483647                      #(B)
print "%d" % num                 # 2147483647                      #(C)

num = num + 1000                                                   #(D)
print "%u" % num                 # 2147484647                      #(E)
print "%d" % num                 # 2147484647                      #(F)
print num                        # 2147484647                      #(G)

# A very large integer:
num = num * num                                                    #(H)
print "%d" % num                 # 4611690309100714609             #(I)
print "%u" % num                 # 4611690309100714609             #(J)
print "%e" % num                 # 4.611690e+18                    #(K)
print num                        # 4611690309100714609             #(L)

# Show some math operators:
num = 16                                                           #(M)
num = num ** 2                                                     #(N)
print num                        # 256                             #(O)
num **= 0.5                                                        #(P)
print num                        # 16.0                            #(Q)
num %= 9                                                           #(R)
print num                        # 7.0                             #(S)
num /= 4                                                           #(T)
print num                        # 1.75                            #(U)
#print num++                     # Error                           #(V)
#print ++num                     # Error                           #(W)

# Force the 'long' representation:
num = 123456L;                                                     #(X)
print num;                       # 123456                          #(Y)

# Another way to force the 'long' representation:
num = long(123456)                                                 #(Z)

# The abs() function:
num = -123                                                         #(a)
print abs(num)                   # 123                             #(b)

# Demonstrate the int() constructor:
x = 123.45678                                                      #(c)
y = int( x )                                                       #(d)
print y                          # 123                             #(e)

x = "123.45678"                                                    #(f)
#y = int( x )                    # Error                           #(g)

x = "123"                                                          #(h)
y = int( x )                     # now okay                        #(i)
print y                          # 123                             #(j)

x = "10101010"                                                     #(k)
print int( x, 2)                 # 170                             #(l)
print int( x, 3)                 # 2460                            #(m)

# Demonstrate the long() constructor:
x = 123.45678                                                      #(n)
y = long( x )                                                      #(o)
print y                          # 123                             #(p)

x = "123.45678"                                                    #(q)
#y = long( x )                   # Error                           #(r)

x = "123"                                                          #(s)
y = long( x )                    # now okay                        #(t)
print y                          # 123                             #(u)

x = "10101010"                                                     #(v)
print long( x, 2)                # 170                             #(w)
print long( x, 3)                # 2460                            #(x)
