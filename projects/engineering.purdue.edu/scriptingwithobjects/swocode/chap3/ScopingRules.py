#!/usr/bin/python

# ScopingRules.py


# example 1:
i = 10                                                                 #(A)
j = 10                                                                 #(B)

def foo():                                                             #(C)
#    print i                                  # ERROR                  #(D)
    print j                                   # 10                     #(E)
    i = 100                                                            #(F)
    i = i * j                                                          #(G)
    print i                                   # 1000                   #(H)

foo()                                                                  #(I)
print i                                       # 10                     #(J)


# example 2:
def foo():                                                             #(K)
    global i                                                           #(L)
    print i                                                            #(M)
    i = 1000                                                           #(N)


i = 500                                                                #(O)
foo()                                         # line (M): 500          #(P)
print i                                       # 1000                   #(Q)


# example 3:
name = age = position = gender = None                                  #(R)

def setUserInfo( aname, years, gend, pos ):                            #(S)
    global name, age, position, gender                                 #(T)
    name = aname                                                       #(U)
    age = years                                                        #(V)
    gender = gend                                                      #(W)
    position = pos                                                     #(X)

setUserInfo( 'Zaphod', 125, 'male', 'boss' )                           #(Y)
print name, age, gender, position             # Zaphod 125 male boss   #(Z)
