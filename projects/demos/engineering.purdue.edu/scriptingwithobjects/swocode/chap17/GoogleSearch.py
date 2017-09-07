#!/usr/bin/env python

### GoogleSearch.py

import SOAPpy                                                        #(A)
import sys                                                           #(B)

key = r'yMBej/tQFHI0CZSHXXSxYzWgdDc1F1We'                            #(C)
query = ' '.join( sys.argv[1:] )                                     #(D)
if not query.lstrip().rstrip():                                      #(E)
    print "exiting --- nothing to search for"                        #(F)
    sys.exit(0)                                                      #(G)

googleSearch = SOAPpy.WSDL.Proxy( "file:GoogleSearch.wsdl" )         #(H)

print googleSearch.methods.keys()                                    #(I)
      # [u'doGoogleSearch', u'doGetCachedPage', u'doSpellingSuggestion']

for method in googleSearch.methods.keys():                           #(J)
    print method                                                     #(K)
    for item in googleSearch.methods[ method ].inparams:             #(L)
        print "%15s\t%s" %  (item.name, item.type[1])                #(M)
    for item in googleSearch.methods[ method ].outparams:            #(N)
        print "%15s\t%s" %  (item.name, item.type[1])                #(O)

result = googleSearch.doGoogleSearch(                                #(P)
               key,            # key supplied by Google              #(Q)
               query,          # the query string                    #(R)
               0,              # start index for retrieved items     #(S)
               10,             # max num (< 10) of items             #(T)
               False,          # deactivate filtering of duplicates  #(U)
               "",             # no country restriction              #(V)
               False,          # deactivate 'safe search'            #(W)
               "",             # no language restriction             #(X)
               "",             # input encoding  (ignored)           #(Y)
               "")             # output encoding (ignored)           #(Z)

print
print "searchQuery: ", result.searchQuery                            #(a)
print "startIndex: ", result.startIndex                              #(b)
print "estimatedtotalResultsCount: ",  \
                     result.estimatedTotalResultsCount               #(c)
print "endIndex: ", result.endIndex                                  #(d)
print "searchTime: ", result.searchTime                              #(e)
print "searchComments: ", result.searchComments                      #(f)
print "documentFiltering: ", result.documentFiltering                #(g)
print "searchTips: ", result.searchTips                              #(h)
print "directoryCategories: ", result.directoryCategories            #(i)
print

if result.resultElements:                                            #(j)
    for item in result.resultElements:                               #(k)
        try:                                                         #(l)
            print item.title or "no title"                           #(m)
            print item.URL                                           #(n)
            print item.snippet or "no snippet"                       #(o)
            print                                                    #(p)
        except UnicodeEncodeError: pass                              #(q)
