#!/usr/local/bin/python

# KeyError.py

x = {'a' : 1, 'b' : 2}                                              #(A)

print x['a']             # 1                                        #(B)
print x['b']             # 2                                        #(C)

print x['c']             # KeyError: 'c'                            #(D)
