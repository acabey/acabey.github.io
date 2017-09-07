#!/usr/local/bin/python

###  ListSorting.py

words = [ 'hello', 'armadello', 'JELLO', 'JAYLO' ]                   #(A)

print words.sort()   # None                                         #(A1) 

# Sort in the default (ascending ASCII) order:
words.sort()                                                         #(B)
print words          # ['JAYLO', 'JELLO', 'armadello', 'hello']      #(C)

# For sorting, consider the strings to be all uppercase:
words.sort( lambda x,y: cmp(x.upper(), y.upper() ) )                 #(D)
print words          # ['armadello', 'hello', 'JAYLO', 'JELLO']      #(E)

# Sort in descending ASCII order:
words.sort( reverse=True )                                           #(F)
print words          # ['hello', 'armadello', 'JELLO', 'JAYLO']      #(G)

# Sort strings on the basis of their lengths
words.sort( key = lambda x: len(x) )                                 #(H)
print words          # ['hello', 'JELLO', 'JAYLO', 'armadello']      #(I)

# Sort strings on the basis of the second character:
words.sort( key=lambda x: x[1]  )                                    #(J)
print words          # ['JAYLO', 'JELLO', 'hello', 'armadello']      #(K)

# Sort numbers by lengths of their print representations:
nums = [1, 100, 10]                                                  #(L)
nums.sort( cmp=lambda x,y: cmp(len(str(y)),len(str(x))))             #(M)
print nums           # [100, 10, 1]                                  #(N)

# A more efficient way:
nums.sort( key=lambda x: len(str(x)), reverse=True)                  #(O)
print nums           # [100, 10, 1]                                  #(P)
