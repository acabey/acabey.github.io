#!/usr/local/bin/python

# ImportError.py

#import test_module.py                  # ImportError:              #(A)
                                        #    No module named .py  
import test_module                                                  #(B)
print test_module.constant_1            # 1000                      #(C)
print test_module.constant_2            # 2000                      #(D)

from test_module import constant_1, constant_2                      #(E)
print constant_1                        # 1000                      #(F)
print constant_2                        # 2000                      #(G)

#from test_module import constant_3     # ImportError: cannot       #(H)
                                        #    import name constant_3   
