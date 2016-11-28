#!/usr/bin/python

# NestedScope.py


x = 1                                                                 #(A)
y = 1                                                                 #(B)

print locals()                                                        #(C)
           # {'__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'y': 1,
           #  '__doc__': None,
           #  'x': 1}

print globals()                                                       #(D)
           # {'__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'y': 1,
           #  '__doc__': None,
           #  'x': 1}

def foo():                                                            #(E)
    x = 2                                                             #(F)
    z = 2                                                             #(G)
    print locals()                                                    #(H)
           # {'x': 2,
           #  'z': 2}
    print globals()                                                   #(I)
           # {'y': 1,
           #  'x': 1,
           #  '__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'foo': <function foo at 0x805bf1c>,
           #  '__doc__': None}
    def bar():                                                        #(J)
        print locals()                                                #(K)
           # {}
        print globals()                                               #(L)
           # {'y': 1,
           #  'x': 1,
           #  '__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'foo': <function foo at 0x805bf1c>,
           #  '__doc__': None}
#       print x                   # ERROR                             #(M)
        print y                   # 1                                 #(N)
        print z                   # 2                                 #(O)
        x = 5                                                         #(P)
        print locals()                                                #(Q)
           # {'x': 5}

        print globals()                                               #(R)
           # {'y': 1,
           #  'x': 1,
           #  '__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'foo': <function foo at 0x805bf1c>,
           #  '__doc__': None}

    print locals()                                                    #(S)
           # {'x': 2,
           #  'z': 2,
           #  'bar': <function bar at 0x804f664>}
    print globals()                                                   #(T)
           # {'y': 1,
           #  'x': 1,
           #  '__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'foo': <function foo at 0x805bf1c>,
           #  '__doc__': None}

    bar()                                                             #(U)
    

print locals()                                                        #(V)
           # {'y': 1,
           #  'x': 1,
           #  '__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'foo': <function foo at 0x805bf1c>,
           #  '__doc__': None}

print globals()                                                       #(W)
           # {'y': 1,
           #  'x': 1,
           #  '__builtins__': <module '__builtin__' (built-in)>,
           #  '__name__': '__main__',
           #  'foo': <function foo at 0x805bf1c>,
           #  '__doc__': None}

foo()                                                                 #(X)
