#!/usr/bin/env python

### ListOps.py

#Define a list:
x = ['zero', 'one', 2, 'three']                                     #(A)
print x                          # ['zero', 'one', 2, 'three']      #(B)

#Show list is mutable:
x[0:2] = [0, 1]                                                     #(C)
print x                          # [0, 1, 2, 'three']               #(D)

#A list can hold disparate types:
print type( x[0] )               # <type 'int'>                     #(E)
print type( x[3] )               # <type 'str'>                     #(F)

#Joining two lists:
y = [4, 5]                                                          #(G)
z = x + y                                                           #(H)
print z                          # [0, 1, 2, 'three', 4, 5]         #(I)

#Test for membership:
print 1 in z                     # True                             #(J)
print 'five' not in z            # True                             #(K)

#Replication operator:
z = x[0:3] * 3                                                      #(L)
print z                          # [0, 1, 2, 0, 1, 2, 0, 1, 2]      #(M)

print len(z)                     # 9                                #(N)
print min(z)                     # 0                                #(O)
print max(z)                     # 2                                #(P)

#Deleting an element by value:
z.remove( 2 )                                                       #(Q)
print z                          # [0, 1, 0, 1, 2, 0, 1, 2]         #(R)

#Inserting an element by value:
z.insert( 2, 'two' )                                                #(S)
print z                          # [0, 1, 'two', 0, 1, 2, 0, 1, 2]  #(T)

#Deleting a slice:
del z[3::2]                                                         #(U)
print z                          # [0, 1, 'two', 1, 0, 2]           #(V)

#Replacing a slice:
z[3:] = [None] * (len(z) - 3)                                       #(W)
print z                          # [0, 1, 'two', None, None, None]  #(X)

#Make the list shorter for the
#rest of the script:
del z[3:]                                                           #(Y)
print z                          # [0, 1, 'two']                    #(Z)

#Appending element at the end:
z.append( 'two' )                                                   #(a)
print z                          # [0, 1, 'two', 'two']             #(b)

#Reversing a list in place:
z.reverse()                                                         #(c)
print z                          # ['two', 'two', 1, 0]             #(d)

#Pop off the value at the end:
print z.pop()                    # 0                                #(e)
print z                          # ['two', 'two', 1]                #(f)

#Sort in place:
z.sort()                                                            #(g)
print z                          # [1, 'two', 'two']                #(h)

#Count the number by elemnt value:
print z.count( 'two' )           # 2                                #(i)

#Find lowest index by element value:
print z.index( 'two' )           # 1                                #(j)

#A slice accessed on its own for
#its elements acts as a separate
#object:
z[:][0] = 1000                                                      #(k)
print z                          # [1, 'two', 'two']                #(l)

#Delete the entire list:
del z                            # deletes the list z from memory   #(m)
#print z                         # WRONG                            #(n)

#A singleton list:
singleton_list = [1]                                                #(o)
print singleton_list             # [1]                              #(p)

#An empty list:
empty_list = []                                                     #(q)
print type(empty_list)           # <type 'list'>                    #(r)

#Generating a list compactly:
z = [ x * 2 for x in range(5) ]                                     #(s)
print z                          # [0, 2, 4, 6, 8]                  #(t)

#Another example:
z = [ x * 3 for x in ['a', 'b', 5] ]                                #(u)
print z                          # ['aaa', 'bbb', 15]               #(v)

#A fancier example:
z = [ x*y for x in [1,2,3] for y in [4,5,6] if x*y > 8 ]            #(w)
print z                          # [10, 12, 12, 15, 18]             #(x)

#Element-on-element operation:
x = [2, 3, 4]
y = [7, 8, 9]
z = [ x[i]*y[i] for i in range(len(x)) ]                            #(y)
print z                          # [14, 24, 36]                     #(z)
