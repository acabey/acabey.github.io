#!/usr/bin/env python

### Guess.py       

import random                                                       #(A)    
import sys                                                          #(B)

ran = random.Random()                                               #(C)

num = ran.randint(0,10)                                             #(D)

while 1:                                                            #(E)
    guess = int( raw_input('Guess an integer between 0 and 10: ') ) #(F)
    if num == guess:                                                #(G)
        print "YOU WIN! Your guess is correct!"                     #(H)
        sys.exit(0)                                                 #(I)
    elif guess < num:                                               #(J)
        print "Your guess is on the low side. Try again."           #(K)
    else:                                                           #(L)
        print "Your guess is on the high side. Try again."          #(M)
