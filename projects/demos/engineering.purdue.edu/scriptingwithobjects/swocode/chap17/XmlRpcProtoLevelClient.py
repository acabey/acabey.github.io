#!/usr/bin/env python

### XmlRpcProtoLevelClient.py

import httplib                                                       #(A)
import re                                                            #(B)
import sys                                                           #(C)

msg = """\
<?xml version="1.0"?>
<methodCall>
    <methodName>sumAndDifference1</methodName>
    <params>
        <param><value><i4>5</i4></value></param>
        <param><value><i4>3</i4></value></param>
    </params>
</methodCall>
"""                                                                  #(D)
host = "localhost:8080"                                              #(E)
handler = "/RPC2"                                                    #(F)

#httplib.HTTPConnection.debuglevel = 1                               #(G)

# send request:
conn = httplib.HTTPConnection( host )                                #(H)
conn.putrequest( "POST", handler )                                   #(I)
conn.putheader( "User-Agent", "element-xmlrpc" )                     #(J)
conn.putheader( "Host", host )                                       #(K)
conn.putheader( "Content-Type", "text/xml" )                         #(L)
conn.putheader( "Content-Length", str( len(msg) ) )                  #(M)
conn.endheaders()   # send a blank line to signify end of headers    #(N)
conn.send(msg)      # send body of message, end with two blank lines #(O)

# get response:
# getresponse() returns an HTTPResponse object:
response = conn.getresponse()                                        #(P)
if response.status != 200:                                           #(Q)
    raise Exception(response.reason, response.status)    

# get resonse body:
response_content =  response.read()                                  #(R)
#print response_content                                              #(S)

# check if the respose contains a fault report:
regex1 = re.compile( r'<fault>(.*)<\/fault>', \
                     re.MULTILINE | re.DOTALL )                      #(T)
m = regex1.search( response_content )                                #(U)
if m is not None:                                                    #(V)
    regex2 = re.compile( r'''faultCode.*<value><.*?>
                             ([^<>]*)            # get fault string  #(W)
                             <.*></value>.*
                             faultString.*<value><.*?>
                             ([^<>]*)            # get fault code    #(X)
                             <.*></value>.*''',
                           re.VERBOSE | re.DOTALL )                  #(Y)
    m_fault = regex2.search( m.group(1) )                            #(Z)
    if m_fault is not None:                                          #(a)
        faultCode = m_fault.group(1).rstrip()                        #(b)
        faultString = m_fault.group(2).rstrip()                      #(c)
        print "XML-RPC request failed: %s; faultCode: %s" % \
              (faultString, faultCode)                               #(d)
    sys.exit(1)                                                      #(e)

# extract the results:
regex3 = re.compile( r'''<name>(.*?)<\/name>                         #(f)
                         <value>                                     #(g)
                         (?:<.*?>)?                                  #(h)
                         ([^<>]*?)                                   #(i)
                         (?:<.*?>)?                                  #(j)
                         <\/value>''',                               #(k)
                     re.VERBOSE | re.DOTALL )                        #(l)

result = regex3.findall( response_content.replace('\n', '' ) )       #(m)
print result            # [('sum', '8'), ('difference', '2')]        #(n)
