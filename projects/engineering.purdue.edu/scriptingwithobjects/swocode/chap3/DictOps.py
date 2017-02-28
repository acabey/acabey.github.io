#!/usr/bin/env python

### DictOps.py

ph_book = { 'yuki' : 3211234, 'xeno' : 5671290, 'trilo' : 342 }     #(A)
print ph_book    # {'xeno': 5671290, 'trilo': 342, 'yuki': 3211234} #(B)

print ph_book.keys()                 # ['xeno', 'trilo', 'yuki']    #(C)

print ph_book.values()               # [5671290, 342, 3211234]      #(D)

print ph_book.items()                                               #(E)
             # [('xeno', 5671290), ('trilo', 342), ('yuki', 3211234)]

print ph_book.has_key( 'xeno' )      # 1                            #(F)

print len( ph_book )                 # 3                            #(G)

x = {'a' : 1, 'b' : 2}                                              #(H)
y = {'b' : 3, 'c' : 4}                                              #(I)
x.update( y )                                                       #(J)
print x                              # {'a': 1, 'c': 4, 'b': 3}       

del y['b']                                                          #(K)
print y                              # {'c': 4}                       
del y                                                               #(L)
#print y                             # ERROR                           

x['d'] = 100                                                        #(M)
print x       # {'a': 1, 'c': 4, 'b': 3, 'd': 100}                    

empty_dict = {}                                                     #(N)
print type( empty_dict )             # <type 'dict'>                   

iter = x.iteritems()                                                #(O)
print [(value, key) for (key, value) in iter]                       #(P)
                        # [(1, 'a'), (4, 'c'), (3, 'b'), (100, 'd')]
iter = x.iteritems()                                                #(Q)
for item in iter:                                                   #(R)
    if item[1] > 3: print item                                      #(S)
                                     # ('c', 4)    
                                     # ('d', 100)

iter = x.iteritems()                                                #(T)
while ( 1 ):                                                        #(U)
    try:                                                            #(V)
        item = iter.next()                                          #(W)
    except StopIteration: break                                     #(X)
    if item[1] > 3: print item                                      #(Y)
                                     # ('c', 4)    
                                     # ('d', 100)

# Dictionary example used in the rest of the script:
mydict = {'a': 10, 'c': 4, 'b': 9, 'd': 100}                        #(Z)

# Key-sorting dictionary contents for display:
keys = mydict.keys()                                                #(a)
keys.sort()                                                         #(b)
for key in keys:                                                    #(c)
    print "%s  %d" % (key, mydict[key])                             #(d)
                                     # a  10
                                     # b  9
                                     # c  4
                                     # d  100

# Another way to key-sort the dictionary contents:
for item in sorted( mydict.items(), lambda x,y: cmp(x[0], y[0]) ):  #(e)
    print item                                                      #(f)
                                     # ('a', 10)
                                     # ('b', 9)
                                     # ('c', 4)
                                     # ('d', 100)

# A value-sorted display of dictionary content:
for item in sorted( mydict.items(), lambda x,y: cmp(x[1], y[1]) ):  #(g)
    print item                                                      #(h)
                                     # ('c', 4)
                                     # ('b', 9)
                                     # ('a', 10)
                                     # ('d', 100)

# Reverse sorting of dictionary contents by value:
for item in sorted( mydict.items(),                                 #(i)
                    lambda x,y: cmp(x[1], y[1]),                    #(j)
                    reverse=True ):                                 #(k)
    print item                                                      #(l)
                                     # ('d', 100)
                                     # ('a', 10)
                                     # ('b', 9)
                                     # ('c', 4)

# Print out a key-sorted list of the values:
print map( mydict.get, sorted( mydict.keys() ) )                    #(m)
                                     # [10, 9, 4, 100]
# Print out a value-sorted list of the values:
print sorted( mydict.values() )                                     #(n)
                                     # [4, 9, 10, 100]
# Print out a list of the values:
print mydict.values()                                               #(o)
                                     # [10, 4, 9, 100]
