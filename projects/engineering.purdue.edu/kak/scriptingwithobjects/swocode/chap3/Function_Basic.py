#!/usr/bin/python

## Function_Basic.py

def get_name():                                                       #(A)
    "Get from the user his/her first and last names"                  #(B)
    first = raw_input( "Enter your first name: " )                    #(C)
    last = raw_input( "Enter your last name: " )                      #(D)
    return (first, last)                                              #(E)

full_name = get_name()                                                #(F)
print full_name                                                       #(G)

print type( get_name )                  # <type 'function'>           #(H)
