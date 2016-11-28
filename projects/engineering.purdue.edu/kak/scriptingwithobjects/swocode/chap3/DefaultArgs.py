#!/usr/bin/python

# DefaultArgs.py


name = age = position = gender = None                                  #(A)

position_default = 'Staff'                                             #(B)

def setUserInfo( aname, years, gend = 'neutral', \
                                          pos = position_default ):    #(C)
    global name, age, position, gender                                 #(D)
    name = aname                                                       #(E)
    age = years                                                        #(F)
    position = pos                                                     #(G)
    gender = gend                                                      #(H)

position_default = 'MemberStaff'                                       #(I)

setUserInfo( 'Trillion', 96, 'female' )                                #(J)
print name, age, gender, position        # Trillion 96 female Staff    #(K)

setUserInfo( 'Trillion', 96 )                                          #(L)
print name, age, gender, position        # Trillion 96 neutral Staff   #(M)
