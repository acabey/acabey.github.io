#!/usr/bin/env python

### While_If.py

print "Enter numbers, one per line.  When done, just enter return.";#(A)

sum = 0                                                             #(B)
while 1:                                                            #(C)
    num = raw_input().rstrip()                                      #(D)
    if num == '':                                                   #(E)
        print "Sum of numbers is: ", sum                            #(F)
        break                                                       #(G)
    sum += float( num )                                             #(H)
