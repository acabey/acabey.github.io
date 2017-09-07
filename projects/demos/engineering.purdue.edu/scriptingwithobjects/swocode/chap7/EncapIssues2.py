#!/usr/bin/python

# EncapIssues2.py

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

xobj.n = 100                                                        #(I)
print xobj.n                 # 100                                  #(J)
print xobj.__dict__          # {'m': 10, 'n': 100}                  #(K)

xobj.p = 100000                                                     #(L)
print xobj.p                 # 100000                               #(M)
print xobj.__dict__          # {'p': 100000, 'm': 10, 'n': 100}     #(N)

xobj2 = X( 300 )                                                    #(O)
print xobj2.getm()           # 300                                  #(P)
print xobj2.__dict__         # {'m': 300}                           #(Q)
