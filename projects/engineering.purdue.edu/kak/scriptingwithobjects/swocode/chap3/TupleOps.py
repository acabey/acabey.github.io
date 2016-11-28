#!/usr/bin/python

### TupleOps.py

#Comma operator defines a tuple:
x = 'zero', 'one', 2, 3                                             #(A)
print x                             # ('zero', 'one', 2, 3)         #(B)

#A more common way to create a tuple:
y = (0, 1, 'two', "three")                                          #(C)
print y                             # (0, 1, 'two', 'three')        #(D)

#A tuple can hold disparate items:
print type( x[0] )                  # <type 'str'>                  #(E)
print type( x[2] )                  # <type 'int'>                  #(F)

#For testing for membership:
print 'one' in x                    # True                          #(G)
print 4 not in y                    # True                          #(H)

#Joining together two tuples:
z = x + y                                                           #(I)
print z            # ('zero', 'one', 2, 3, 0, 1, 'two', 'three')    #(J)

#Illegal, tuple is immutable:
#x[0] = 0                           # WRONG                         #(K)

#Immutability may not apply to
#interior structors:
w = ([1, 2, 3], 4, 5)                                               #(L)
print w                             # ([1, 2, 3], 4, 5)             #(M)
w[0][0] = 100                                                       #(N)
print w                             # ([100, 2, 3], 4, 5)           #(O)

#Replication operator:
x = 1,2                                                             #(P)
print x * 3                         # (1, 2, 1, 2, 1, 2)            #(Q)

#Slicing operations:
print z[4:]                         # (0, 1, 'two', 'three')        #(R)
print z[:4]                         # ('zero', 'one', 2, 3)         #(S)
print z[1:6:2]                      # ('one', 3, 1)                 #(T)

#Some utility functions:
print len(w)                        # 3                             #(U)
print min(w)                        # 4                             #(V)
print max(w)                        # [100, 2, 3]                   #(W)

#To delete an entire tuple:
del w                                                               #(X)
#print w                            # WRONG                         #(Y)

#The role of comma again:
print ("4", 5, '''six''')           # ('4', 5, 'six')               #(Z)
print "4", 5, '''six'''             # 4 5 six                       #(a)
print "4",; print 5,; print "six"   # 4 5 six                       #(b)

#Singleton tuple:
singleton_tuple = (1,)                                              #(c)
print singleton_tuple               # (1,)                          #(d)

#Empty tuple:
empty_tuple = ()                                                    #(e)
print type(empty_tuple)             # <type 'tuple'>                #(f)
