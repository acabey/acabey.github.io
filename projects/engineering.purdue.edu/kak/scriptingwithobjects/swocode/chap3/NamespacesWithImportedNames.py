#!/usr/bin/python

# NamespacesWithImportedNames.py

from FetchOneOf import fetchOneWord, best_pie                         #(A)

# print FetchOneOf.__dict__              # ERROR                      #(B)

print locals()                                                        #(C)
        # {'fetchOneWord': <function fetchOneWord at 0x8069d74>,
        #  '__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  '__doc__': None,
        #  'best_pie': 'applepie'}


print globals()                                                       #(D)
        # {'fetchOneWord': <function fetchOneWord at 0x8069d74>,
        #  '__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  '__doc__': None,
        #  'best_pie': 'applepie'}

handle = open( "info.txt" )                                           #(E)

print locals()                                                        #(F)
        # {'fetchOneWord': <function fetchOneWord at 0x8069d74>,
        #  'handle': <open file 'info.txt', mode 'r' at 0x8092c40>,
        #  '__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  '__doc__': None,
        #  'best_pie': 'applepie'}

w = fetchOneWord( handle )                                            #(G)

print locals()                                                        #(H)
        # {'fetchOneWord': <function fetchOneWord at 0x8069d74>,
        #  'handle': <open file 'info.txt', mode 'r' at 0x8092c40>,
        #  'w': 'how',
        #  '__builtins__': <module '__builtin__' (built-in)>,
        #  '__name__': '__main__',
        #  '__doc__': None,
        #  'best_pie': 'applepie'}

print w                # how                                          #(I)
