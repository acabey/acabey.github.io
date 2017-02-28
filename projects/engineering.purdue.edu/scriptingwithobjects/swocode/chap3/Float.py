#!/usr/bin/python

### Float.py

x = 0.000000000003                                                 #(A)
y = 1234.000000000003                                              #(B)
print x * y                         # 3.702e-09                    #(C)
print "%.3e" % (x * y)              # 3.702e-09                    #(D)

y = 1234 + 3.00e-12                                                #(E)
print x * y                         # 3.702e-09                    #(F)
print "%.14e" % (x * y)             # 3.70200000000001e-09         #(G)

z = 1e50                                                           #(H)
print x / z                         # 3e-62                        #(I)

print float(x)                      # 3e-12                        #(J)
print float(y)                      # 1234.0                       #(K)

x = "1234.5678"                                                    #(L)
print float( x )                    # 1234.5678                    #(M)

