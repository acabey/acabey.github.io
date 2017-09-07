#!/usr/bin/env python

### PrintFiles.py

import sys                      # for argv[], exit()                #(A)
import os                       # for system()                      #(B)

if len( sys.argv ) < 2:                                             #(C)
    print "Needs at least one file name as argument"                #(D)
    sys.exit(1)                                                     #(E)

for item in sys.argv[1:]:                                           #(F)
    if item.endswith( ('.ps', '.pdf') ):                            #(G)
        cmd = "/usr/local/bin/gs -q -dPrinted -dNOPAUSE " \
              "-sOUTPUTFILE=- -sDEVICE=pswrite "          \
              "%s" % item                                           #(H)
        cmd = cmd + " -c quit | lp -d elt339"                       #(I)
        os.system( cmd )                                            #(J)
