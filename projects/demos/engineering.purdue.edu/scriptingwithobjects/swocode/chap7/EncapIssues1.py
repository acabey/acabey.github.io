#!/usr/bin/python

# EncapIssues1.py

#--------------------------   class X  ---------------------------------
class X:                                                            #(A)
    def __init__( self, mm ):                                       #(B)
        self.m = mm                                                 #(C)

    def getm(self):                                                 #(D)
        return self.m                                               #(E)
#--------------------- end of class definition  ------------------------

xobj = X( 10 );                                                     #(F)
print xobj.getm()       # 10                                        #(G)

def foo( self, nn ):                                                #(H)
    print nn                            

X.foo = foo                                                         #(I)

xobj.foo( 100 )         # 100                                       #(J)

print X.__dict__        # {'__module__': '__main__',                #(K)
                        #  'foo': <function foo at 0x805bf1c>,
                        #  'getm': <function getm at 0x804f5a4>,
                        #  '__init__': <function __init__ at 0x804f664>,
                        #  '__doc__': None}

