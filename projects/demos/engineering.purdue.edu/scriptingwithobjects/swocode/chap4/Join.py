#!/usr/local/bin/python
  
## Join.py

words = ["hello", "yello", "mello", "jello"]                       #(A)

string = ":".join( words )                                         #(B)
print string                          # hello:yello:mello:jello    #(C)

string = " ".join( words )                                         #(D)
print string                          # hello yello mello jello    #(E)
