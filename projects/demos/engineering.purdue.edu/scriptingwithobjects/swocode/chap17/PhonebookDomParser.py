#!/usr/bin/env python

###  PhonebookDomParser.py

import xml.dom.minidom

dom = xml.dom.minidom.parse( 'Phonebook.xml' )                       #(A)
rootNode = dom.documentElement                                       #(B)

listings = rootNode.getElementsByTagName( 'listing' )                #(C)

for listing in listings:                                             #(D)
    lastName = listing.getElementsByTagName('last')[0].childNodes[0].data
    firstName = listing.getElementsByTagName('first')[0].childNodes[0].data
    phone = listing.getElementsByTagName('phone')[0].childNodes[0].data
    print "      %-10s %-10s\t%15s" % (lastName, firstName, phone)
