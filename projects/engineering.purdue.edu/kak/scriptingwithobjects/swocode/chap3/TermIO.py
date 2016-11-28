#!/usr/bin/python

### TermIO.py

# Both loops below do the same thing.  Enter Ctrl-D
# to switch from one loop to the next.

import sys                                                          #(A)

print "Starting first loop:"                                        #(B)
while 1:                                                            #(C)
    input = sys.stdin.readline()                                    #(D)
    if (input == ''): break                                         #(E)
    sys.stdout.writelines( ("FIRST LOOP: You said => ", input) )    #(F)

print "Starting second loop:"                                       #(G)
while 1:                                                            #(H)
    try:                                                            #(I)
        input = raw_input()                                         #(J)
    except EOFError: break                                          #(K)
    print "SECOND LOOP:  You said =>  %s" % input                   #(L)

final_input = raw_input( "Are you really done? "                    #(M)
                         "Enter 'yes' or 'no': ")                   #(N)

if ( final_input == "yes" ):                                        #(O)
    sys.exit(0)                                                     #(P)
else:                                                               #(Q)
    sys.stderr.writelines( "sorry\n" )                              #(R)
    sys.exit("sorry again\n")                                       #(S)
