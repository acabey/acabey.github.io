#!/usr/bin/env python

###  Serialization.py

import pickle                                                       #(A)

pets  = ("poodle", "chihuahua", "huskie")                           #(B)
fruit = { "banana" : { "color" : 'yellow',                          #(C)
                       "price" :  0.35 },                           #(D)
          "orange" : { "color" : 'orange',                          #(E)
                       "price" :  0.28 } }                          #(F)
current_year = 2008                                                 #(G)
name = "Beeblecrox"                                                 #(H)

# Serialize the above objects into a single byte stream:
serialized_output = pickle.dumps((pets, fruit, current_year, name)) #(I)

# Recover the individual objects from the serialized stream:
recover = pickle.loads( serialized_output )                         #(J)

print recover[0]   # ('poodle', 'chihuahua', 'huskie')              #(K)

print recover[1]   # {'orange': {'color': 'orange',                 #(L)
                   #             'price': 0.28000000000000003},
                   #  'banana': {'color': 'yellow',
                   #                      'price': 0.34999999999999998}}
print recover[2]   # 2008                                           #(M)

print recover[3]   # Beeblecrox                                     #(N)

# Directly write out the serialization to a file:
pickle.dump((pets, fruit, current_year, name),open('backup.p', 'w'))#(O)

#-----------------------------------------------------------------------
# Restore the objects from the disk file:
restored = pickle.load( open( 'backup.p' ) )                        #(P)

print restored     # exactly the same as for the 'recover' string   #(Q)
