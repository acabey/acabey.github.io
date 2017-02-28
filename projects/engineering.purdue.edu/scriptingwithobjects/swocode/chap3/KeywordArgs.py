#!/usr/bin/python

# KeywordArgs.py


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

setUserInfo( years = 96, aname = 'Trillion', gend = 'female' )         #(J)
print name, age, gender, position        # Trillion 96 female Staff    #(K)

setUserInfo( 'Trillion', gend = 'female', years = 96 )                 #(L)
print name, age, gender, position        # Trillion 96 female Staff    #(M)



# setUserInfo( years = 96, aname = 'Trillion', gend = 'female', 'HiStaff' )
# SyntaxError: non-keyword arg after keyword arg
