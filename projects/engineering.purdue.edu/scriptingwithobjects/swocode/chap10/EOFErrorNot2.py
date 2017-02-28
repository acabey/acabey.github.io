#!/usr/local/bin/python

# EOFErrorNot2.py

import fileinput                                                    #(A)

for line in fileinput.input():                                      #(B)
    print fileinput.filename(), fileinput.filelineno(), ': ', line  #(C)
