#!/usr/local/bin/python

###  BuiltinSorted.py

words = ( 'hello', 'armadello', 'JELLO', 'JAYLO' )                   #(A)

# Sort in the default (ascending ASCII) order:
sortedwords = sorted( words )                                        #(B)
print sortedwords    # ['JAYLO', 'JELLO', 'armadello', 'hello']      #(C)

# For sorting, consider the strings to be all uppercase:
sortedwords = sorted( words, lambda x,y: cmp(x.upper(), y.upper() ) )#(D)
print sortedwords    # ['armadello', 'hello', 'JAYLO', 'JELLO']      #(E)

# Sort in descending ASCII order:
sortedwords = sorted( words, reverse=True )                          #(F)
print sortedwords    # ['hello', 'armadello', 'JELLO', 'JAYLO']      #(G)

# Sort strings on the basis of their lengths
sortedwords = sorted( words, key = lambda x: len(x) )                #(H)
print sortedwords    # ['hello', 'JELLO', 'JAYLO', 'armadello']      #(I)

# Sort strings on the basis of the second character:
sortedwords = sorted( words, key=lambda x: x[1]  )                   #(J)
print sortedwords    # ['JAYLO', 'JELLO', 'hello', 'armadello']      #(K)

# Sort numbers by lengths of their print representations:
nums = (1, 100, 10)                                                  #(L)
sortednums = sorted(nums, \
                    cmp=lambda x,y: cmp(len(str(y)),len(str(x))))    #(M)
print sortednums     # [100, 10, 1]                                  #(N)

# A more efficient way:
sortednums = sorted(nums, key=lambda x: len(str(x)), reverse=True)   #(O)
print sortednums     # [100, 10, 1]                                  #(P)

# A string by itself is a sequence:
string = 'jellomello'                                                #(Q)
sortedchars = sorted( string )                                       #(R)
print sortedchars    # ['e','e','j','l','l','l','l','m','o','o']     #(S)
