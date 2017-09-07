#!/usr/bin/python

### Complex.py

z = 123J                                                           #(A)
print z                                  # 123j                    #(B)
print z.real, z.imag                     # 0.0 123.0               #(C)

z = complex( 3, 4 )                                                #(D)
print z                                  # (3+4j)                  #(E)
print z.real, z.imag                     # 3.0 4.0                 #(F)

t = 1 +  2j                                                        #(G)
print z * t                              # (-5+10j)                #(H)

print z / t                              # (2.2-0.4j)              #(I)

print z ** 0.5                           # (2+1j)                  #(J)
