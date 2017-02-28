#!/usr/bin/python

### DescriptorClass.py

#-----------------------  class DescriptorSimple  ----------------------

class DescriptorSimple( object ):                                   #(A)
    
    def __init__( self, initval=None ):                             #(B)
        self.val = initval                                          #(C)

    def __get__( self, owner_inst, owner_type ):                    #(D)
        print "Retrieving with owner instance: ", owner_inst,   \
                           " and owner type: ", owner_type          #(E)
        return self.val                                             #(F)

    def __set__( self, owner_inst, val ):                           #(G)
        print 'Setting attribute for owner instance: ', owner_inst  #(H)
        self.val = val                                              #(I)

#------------------------  class UserClass  ---------------------------- 

class UserClass( object ):                                          #(J)
    d1 = DescriptorSimple( 100 )                                    #(K)
    d2 = DescriptorSimple( 200 )                                    #(L)
    d3 = 300                                                        #(M)

#-----------------------------  Test Code  -----------------------------

u = UserClass()                                                     #(N)
print u.d1                  # 100                                   #(O)
print u.d2                  # 200                                   #(P)
print u.d3                  # 300                                   #(Q)

print UserClass.d1          # 100                                   #(R)

u.d1 = 400                                                          #(S)
u.d2 = 500                                                          #(T)

print u.d1                  # 400                                   #(U)
print u.d2                  # 500                                   #(V)

print UserClass.__dict__                                            #(W)
     # {'__module__': '__main__', '__doc__': None,
     #  '__dict__': <attribute '__dict__' of 'UserClass' objects>,
     #  '__weakref__': <attribute '__weakref__' of 'UserClass' objects>,
     #  'd2': <__main__.DescriptorSimple object at 0x403b5b0c>,
     #  'd3': 300,
     #  'd1': <__main__.DescriptorSimple object at 0x403b59ec>}

UserClass.d1 = 600          # Does not do what you might think!!!   #(X)

print UserClass.__dict__                                            #(Y)
     # {'__module__': '__main__', '__doc__': None,
     #  '__dict__': <attribute '__dict__' of 'UserClass' objects>,
     #  '__weakref__': <attribute '__weakref__' of 'UserClass' objects>,
     #  'd2': <__main__.DescriptorSimple object at 0x403b5b0c>,
     #  'd3': 300,
     #  'd1': 600}

print u.__dict__            # {}                                    #(Z)
