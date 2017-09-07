#!/usr/bin/python

### PathAttributes.py

import os                                                           #(A)
print "name: ", os.name                        # module: posix      #(B)
print "path: ", os.path                        # module: posixpath  #(C)
print "current dir: ", os.curdir               # .                  #(D)
print "parent dir: ", os.pardir                # ..                 #(E)
print "pathname separator: ", os.sep           # /                  #(F)
print "alternate path separator: ", os.altsep  # None               #(G)
print "extension separator: ", os.extsep       # .                  #(H)
print "srch path comp separator: ", os.pathsep # :                  #(I)
print "line separator: ", os.linesep           # \n                 #(J)
print "default search path: ", os.defpath      # :/bin:/usr/bin     #(K)
