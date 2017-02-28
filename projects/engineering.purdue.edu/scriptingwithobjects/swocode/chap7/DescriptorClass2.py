#!/usr/bin/python

### DescriptorClass2.py

#-------------------------  class MyDescriptor  -----------------------

class MyDescriptor( object ):                                       #(A)
    
    def __init__( self, initval=None ):                             #(B)
        self.val = initval                                          #(C)

    def __get__( self, owner_inst, owner_type ):                    #(D)
        return self.val                                             #(E)

    def __set__( self, owner_inst, val ):                           #(F)
        self.val = val                                              #(G)

#---------------------------  global foo()  ---------------------------- 

def foo():                                                          #(H)
    print "foo called"

#-------------------------  class OwnerClass  --------------------------

class OwnerClass( object ):                                         #(I)

    def bar():                                                      #(J)
        print "bar called"

    d1 = MyDescriptor( foo )                                        #(K)
    d2 = MyDescriptor( bar )                                        #(L)
    d3 = 300                                                        #(M)
    
#-----------------------------  Test Code  -----------------------------

x = OwnerClass()                                                    #(N)
print x.d1                  # <function foo at 0x403b225c>          #(O)
print x.d2                  # <function bar at 0x403b2dbc>          #(P)
print x.d3                  # 300                                   #(Q)

print x.__dict__            # {}                                    #(R)

print OwnerClass.__dict__                                           #(S)
    # {'__module__': '__main__', 'bar': <function bar at 0x403b2dbc>,
    #  '__doc__': None,
    #  '__dict__': <attribute '__dict__' of 'OwnerClass' objects>,
    #  '__weakref__': <attribute '__weakref__' of 'OwnerClass' objects>,
    #  'd2': <__main__.MyDescriptor object at 0x403b5a8c>,
    #  'd3': 300,
    #  'd1': <__main__.MyDescriptor object at 0x403b5b0c>}

x.d1()                      # foo called                            #(T)
x.d2()                      # bar called                            #(U)

#x.bar()                    # ERROR                                 #(V)

OwnerClass.d1()             # foo called                            #(W)
OwnerClass.d2()             # bar called                            #(X)

def baz():                                                          #(Y)
    print "baz called"

x.d1 = baz                                                          #(Z)
x.d1()                      # baz called                            #(a)
OwnerClass.d1()             # baz called                            #(b)

print x.__dict__            # {}                                    #(c)

print OwnerClass.__dict__                                           #(d)
    # {'__module__': '__main__', 'bar': <function bar at 0x403b2dbc>,
    #  '__doc__': None,
    #  '__dict__': <attribute '__dict__' of 'OwnerClass' objects>,
    #  '__weakref__': <attribute '__weakref__' of 'OwnerClass' objects>,
    #  'd2': <__main__.MyDescriptor object at 0x403b5a8c>,
    #  'd3': 300,
    #  'd1': <__main__.MyDescriptor object at 0x403b5b0c>}

