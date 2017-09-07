#!/usr/bin/env python

### Eval.py

import re

mydict = { 'x' : 3, 'y' : 4 }                                        #(A)

entry = raw_input("Enter a polynomial in x, and y."
                  " Use '^' for powers: ")                           #(B)

entry = re.sub( r'\b(\d*)(x|y)', r'\1*\2', entry )                   #(C)

print eval( entry.replace('^', '**'), mydict )                       #(D)
