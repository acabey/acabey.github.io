#!/usr/bin/python

# ObjectUbiquity.py

x = 100                                                               # (A)
iden = id( x )                                                        # (B)
print iden                                    # 134601696             # (C)
tipe = type( x )                                                      # (D)
print tipe                                    # <type 'int'>          # (E)
print x                                       # 100                   # (F)


x = "hello"                                                           # (G)
id = id( x )                                                          # (H)
print id                                      # 134818504             # (I)
tipe = type( x )                                                      # (J)
print tipe                                    # <type 'str'>          # (K)
print x                                       # hello                 # (L)
print len( x )                                # 5                     # (M)
print x.count( 'l' )                          # 2                     # (N)


