#!/usr/local/bin/python

# IndexError.py

t = ('zero', 'one', 'two')                                          #(A)

print t[0]              # 'zero'                                    #(B)
print t[1]              # 'one'                                     #(C)
print t[2]              # 'two'                                     #(D)

# print t[3]            # IndexError: tuple index out of range      #(E)
