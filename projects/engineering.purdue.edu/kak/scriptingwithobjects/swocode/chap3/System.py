#!/usr/bin/env python

### System.py

import os, re, string                                               #(A)

exit_status = os.system( 'ps -j -U kak  > temp' )                   #(B)
print exit_status                      # 0                          #(C)

thispid = os.getpid()                                               #(D)
print thispid                          # 29333                      #(E)
print os.getppid()                     # 2978                       #(F)
print os.getpgid( thispid )            # 29333                      #(G)
print os.getpgid( 0 )                  # 29333                      #(H)

IN = open("temp")                                                   #(I)

# Eliminate any white-space chars at the two ends of each line:
all = map( string.strip,  IN.readlines() )                          #(J)

# Alternative syntax for above:
#all = [item.strip() for item in IN.readlines()]                    #(K)

# Construct regex for extracting info related to just thispid:
regex = r'\b' + str(thispid) + r'\b'                                #(L)

print "\n".join( filter( (lambda x: re.search(regex, x)), all ) )   #(M)
              #  PID   PGID   SID  TTY       TIME      CMD
              # 29333 29333  2978  pts3     00:00:00  System.py
              # 29334 29333  2978  pts3     00:00:00  sh
              # 29335 29333  2978  pts3     00:00:00  ps

group_leaders = []                                                  #(N)
session_leaders = []                                                #(O)

for eachline in all:                                                #(P)
    arr = eachline.split()                                          #(Q)
    #Is PID the same as GID?
    if (arr[0] == arr[1]):                                          #(R)
        group_leaders.append( arr[0] )                              #(S)
    #Are PID, GID, and SID the same?
    if (arr[0] == arr[1] == arr[2]):                                #(T)
        session_leaders.append( arr[0] )                            #(U)

#Sort group leader PID's (ascending order):
group_leaders.sort( (lambda x,y: cmp(int(x), int(y))) )             #(V)

#Sort session leader PID's (ascending order):
session_leaders.sort( (lambda x,y: cmp(int(x), int(y))) )           #(W)

print "Group leaders: ", group_leaders                              #(X)
             # Group leaders:  ['2205', '2363', '2795', '2796', \
             # '2797', '2798', '2939', '3908', '11862', '12175',\
             # '21002', '29308', '29333']

print "Session leaders: ", session_leaders                          #(Y)
             # Session leaders:  ['2363', '2795', '2796', '2797',\
             # '2798', '11862', '12175', '21002', '29308']

common_leaders = filter( (lambda x: x in session_leaders),
                            group_leaders )                         #(Z)
print "Group leaders that are also session leaders: ",       \
                       common_leaders                               #(a)
             # Group leaders that are also session leaders:  \
             # ['2363', '2795', '2796', '2797', '2798',      \
             # '11862', '12175', '21002', '29308']

diff_leaders = filter( (lambda x: x not in session_leaders),
                                   group_leaders )                  #(b)
print "Group leaders that are not session leaders: ", diff_leaders  #(c)
             # Group leaders that are not session leaders:  \
             # ['2205', '2939', '3908', '29333']
