#!/usr/bin/python

# Private.py

#------------------------------  class X  ------------------------------
class X:                                                            #(A)
    __m = 10                                                        #(B)

    n = 20                                                          #(C)

    def __init__( self, pp, qq ):                                   #(D)
        self.__p = pp                                               #(E)
        self.q = qq + self.__p * X.__m + X.n                        #(F)

#-----------------------------  Test Code  ------------------------------
xobj = X( 30, 40 )                                                  #(G)

#print xobj.__p      # ERROR                                        #(H)
print xobj.q         # 360                                          #(I)

#print X.__m         # ERROR                                        #(J)
#print xobj.__m      # ERROR                                        #(K)

print X.n            # 20                                           #(L)
print xobj.n         # 20                                           #(M)

print X._X__m        # 10                                           #(N)
print xobj._X__m     # 10                                           #(O)
print xobj._X__p     # 30                                           #(P)

print X.__dict__     # {'__module__': '__main__',                   #(Q)
                     #  '__doc__': None,
                     #  '_X__m': 10,
                     #  '__init__': <function __init__ at 0x804f664>,
                     #  'n': 20}

print xobj.__dict__  # {'_X__p': 30, 'q': 360}                      #(R)

X.__m = 1000         # but this is not the same as __m of line (B)  #(S)
print xobj.__m       # 1000                                         #(T)
print X.__dict__     # {'__module__': '__main__',                   #(U)
                     #  '_X__m': 10,
                     #  '__m': 1000,
                     #  '__doc__': None,
                     #  '__init__': <function __init__ at 0x804f664>,
                     #  'n': 20}

xobj.__p = 2000      # but this is not the same as __p of line (E)  #(V)
print xobj.__p       # 2000                                         #(W)
print xobj.__dict__  # {'_X__p': 30, 'q': 360, '__p': 2000}         #(X)
