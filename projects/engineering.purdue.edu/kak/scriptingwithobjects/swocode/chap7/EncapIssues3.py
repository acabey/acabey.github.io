#!/usr/bin/python

# EncapIssues3.py

#--------------------------   class X  ---------------------------------
class X:                                                            #(A)
    def __init__( self, mm ):                                       #(B)
        self.m = mm                                                 #(C)

    def getm(self):                                                 #(D)
        return self.m                                               #(E)
#--------------------- end of class definition  ------------------------

xobj = X( 10 );                                                     #(F)
print xobj.getm()            # 10                                   #(G)
print xobj.__dict__          # {'m': 10}                            #(H)

def __init__( self, mm, nn ):                                       #(I)
    self.m = mm                                                     #(J)
    self.n = nn                                                     #(K)

X.__init__ = __init__                                               #(L)

def getn( self ):                                                   #(M)
    return self.n                                                   #(N)

X.getn = getn                                                       #(O)

print X.__dict__    # {'__module__': '__main__',                    #(P)
                    #  'getn': <function getn at 0x804f664>,
                    #  'getm': <function getm at 0x805a47c>,
                    #  '__init__': <function __init__ at 0x805bf1c>,
                    #  '__doc__': None}

#xobj2 = X( 20 )             # ERROR                                #(Q)

xobj3 = X( 100, 200 )                                               #(R)
print xobj3.getm()           # 100                                  #(S)
print xobj3.getn()           # 200                                  #(T)
