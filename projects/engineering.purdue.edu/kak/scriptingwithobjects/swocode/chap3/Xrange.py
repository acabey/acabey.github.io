#!/usr/local/bin/python

# Xrange.py

for i in xrange( 4 ): print i*i, ' ',          # 0 1 4 9            #(A)
print

for i in xrange(1, 4): print i*i, ' ',         # 1 4 9              #(B)
print

for i in xrange(4, 1, -2): print i*i, ' ',     # 16 4               #(C)
print

xr = xrange( 4 )                                                    #(D)
print xr                                       # xrange(4)          #(E)

r = range( 4 )                                                      #(F)
print r                                        # [0, 1, 2, 3]       #(G)

print len( xr )                                # 4                  #(H)

print len( r )                                 # 4                  #(I)
