#!/usr/bin/python

# DeeplyNested.py

x = 1                                                                 #(A)
     
def foo1():                                                           #(B)
    x = 2                                                             #(C)
    def foo2():                                                       #(D)
        x = 3                                                         #(E)
        def foo3():                                                   #(F)
            global x                                                  #(G)
            print x                # 1                                #(H)
        foo3()                                                        #(I)
    foo2()                                                            #(J)
foo1()                                                                #(K)
