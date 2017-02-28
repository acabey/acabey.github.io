#!/usr/bin/python

# NamespacesWithImport.py

import FetchOneOf                                                     #(A)

print FetchOneOf.__dict__                                             #(B)
        # {'fetchOneWord': <function fetchOneWord at 0x804e6f4>,
        #  'fetchOneFloat': <function fetchOneFloat at 0x806e71c>,
        #  '__builtins__': {'help': Type help() for interactive help, or
        #                           help(object) for help about object.,
        #                   'vars': <built-in function vars>,
        #                   'pow': <built-in function pow>,
        #                   .......
        #                   .......
        #                   ....... }
        #  '__name__': 'FetchOneOf',
        #  '__file__': 'FetchOneOf.pyc',
        #  'best_pie': 'apple',
        #  'wordCount': <function wordCount at 0x806018c>,
        #  '__doc__': 'This module ........... '
        #  'fetchOneInteger': <function fetchOneInteger at 0x80663bc>}

N = 2                                                                 #(C)

print locals()                                                        #(D)
        # {'__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  'N': 2,
        #  '__doc__': None,
        #  'FetchOneOf': <module 'FetchOneOf' from 'FetchOneOf.pyc'>} 

print globals()                                                       #(E)
        # {'__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  'N': 2,
        #  '__doc__': None,
        #  'FetchOneOf': <module 'FetchOneOf' from 'FetchOneOf.pyc'>} 

def getNthWord( filename ):                                           #(F)
    print locals()                                                    #(G)
        # {'filename': 'info.txt'}
    print globals()                                                   #(H)
        # {'getNthWord': <function getNthWord at 0x8066374>,
        #  'FetchOneOf': <module 'FetchOneOf' from 'FetchOneOf.pyc'>,
        #  '__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  '__doc__': None,
        #  'N': 2} 
#   print N                                     # ERROR               #(I)

    print FetchOneOf.best_pie                   # appleie             #(J)
    FetchOneOf.best_pie = "cherrypie"                                 #(K)
    print FetchOneOf.best_pie                   # cherrypie           #(L)

    print FetchOneOf.__dict__                                         #(M)
        # {'fetchOneWord': <function fetchOneWord at 0x804e6f4>,
        #  'fetchOneFloat': <function fetchOneFloat at 0x806e71c>,
        #  '__builtins__': {'help': Type help() for interactive help, or
        #                           help(object) for help about object.,
        #                   'vars': <built-in function vars>,
        #                   'pow': <built-in function pow>,
        #                   .......
        #                   .......
        #                   ....... }
        #  '__name__': 'FetchOneOf',
        #  '__file__': 'FetchOneOf.pyc',
        #  'best_pie': 'cherrypie',
        #  'wordCount': <function wordCount at 0x806018c>,
        #  '__doc__': 'This module ........... '
        #  'fetchOneInteger': <function fetchOneInteger at 0x80663bc>}

    print locals()                                                    #(N)
        # {'filename': 'info.txt'}
    print globals()                                                   #(O)
        # {'getNthWord': <function getNthWord at 0x80663cc>,
        #  'FetchOneOf': <module 'FetchOneOf' from 'FetchOneOf.pyc'>,
        #  '__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  '__doc__': None,
        #  'N': 2} 

    h = open( filename )                                              #(P)
    global N                                                          #(Q)
    while N > 0:                                                      #(R)
        FetchOneOf.fetchOneWord( h )                                  #(S)
        N = N - 1                                                     #(T)
    return FetchOneOf.fetchOneWord( h )                               #(U)


print N                                          # 2                  #(V)
w = getNthWord( 'info.txt' )                                          #(W)
print w                                          # you                #(X)
print N                                          # 0                  #(Y)

print FetchOneOf.best_pie                        # cherrypie          #(Z)
