#!/usr/bin/env python

###  CSV.py

import re                                                            #(A)

class CSV( object ):                                                 #(B)

    def __init__( self, db_file ):                                  #(C1)
        self._dbfile =  db_file                                     #(C2)
        self._db     =  []                                          #(C3)

    def populate_database_from_disk_file( self ):                   #(D1)
        FILE = None                                                 #(D2)
        try:                                                        #(D3)
            FILE = open( self._dbfile )                             #(D4)
        except IOError:                                             #(D5)
            print "unable to open %s" % self._dbfile                #(D6)
        for line in FILE:                                           #(D7)
            record = re.split( r',', line[0:-1] )                   #(D8)
            self.enter_record_from_file( record )                   #(D9)
        FILE.close()                                               #(D10)

    def write_database_to_file( self ):                             #(E1)
        FILE = None                                                 #(E2)
        try:                                                        #(E3)
            FILE = open( self._dbfile, 'w' )                        #(E4)
        except IOError:                                             #(E5)
            print "unable to open %s" % self._dbfile                #(E6)
        csv_strings = [  ','.join(item) for item in self._db ]      #(E7)
        all_csv_strings = '\n'.join( csv_strings )                  #(E8)
        FILE.write( all_csv_strings )                               #(E9)
        FILE.close()                                               #(E10)

    def show_schema( self ):                                        #(F1)
        schema = self._db[0]                                        #(F2)
        print_string = "   ".join( schema )                         #(F3)
        print print_string                                          #(F4)

    def enter_record_from_file( self, record ):                     #(G1)
        self._db.append( record )                                   #(G2)

    def enter_new_record_from_terminal( self, *entries ):           #(H1)
        num_rows_in_db = len( self._db )                            #(H2)
        new_record = list( entries )                                #(H3)
        new_record.insert(0, repr(num_rows_in_db) )                 #(H4)
        self._db.append( new_record )                               #(H5)
        self.write_database_to_file()                               #(H6)

    def retrieve_column( self, column_index ):                      #(J1)
        for i in range( 1, len(self._db) ):                         #(J2)
            print self._db[i][column_index]                         #(J3)

    def retrieve_row( self, row_index ):                            #(K1)
        print self._db[row_index]                                   #(K2)

    def show_row_for_last_name( self, lname):                       #(L1)
        for i in range(1, len( self._db ) ):                        #(L2)
            if self._db[i][1] == lname:                             #(L3)
                for j in range( len( self._db[0] ) ):               #(L4)
                    print "%15s:  %s\n" % (self._db[0][j], \
                                           self._db[i][j])          #(L5)
                return i                                            #(L6)

    def interactive( self ):                                        #(M1)
        while 1:                                                    #(M2)
            answer = raw_input("\nDo you wish to have an " +
                               "interactive session with the " +
                               "database? \nEnter yes or no:  ")    #(M3)
            if answer.find( 'y' ) is not -1:                        #(M4)
                print "\nLast names stored in the database:\n"      #(M5)
                self.retrieve_column(1)                             #(M6)
                last_name = raw_input("Whose record do you wish " +
                                      "to view/change? ")           #(M7)
                print "\nHere is the record for this last name:\n"  #(M8)
                row_index = self.show_row_for_last_name( last_name )#(M9)
                answer = raw_input("Do you wish to change this record?\n" +
                               "Enter yes or no: " )               #(M10)
                if answer.find( 'y' ) is not -1:                   #(M11)
                    old_entry= raw_input( "Old entry: " )          #(M12)
                    new_entry = raw_input( "New entry: " )         #(M13)
                    for j in range(1, len(self._db[row_index])):   #(M14)
                        if self._db[row_index][j] == old_entry:    #(M15)
                            self._db[row_index][j] = new_entry     #(M16)
                else: continue                                     #(M17)
            else: break                                            #(M18)
        self.write_database_to_file()                              #(M19)


if __name__ == '__main__':                                          #(T1)

    db = CSV( "data.db" )                                           #(T2)
    db.populate_database_from_disk_file()                           #(T3)
    db.show_schema()                                                #(T4)
    db.retrieve_column(2)                                           #(T5)
    db.show_row_for_last_name( 'smythe' )                           #(T6)
    db.retrieve_row(2)                                              #(T7)
    db.enter_new_record_from_terminal("annaz","pollyz", \
              "home economicsz", "sunshine universityz", \
              "perfectvillez","X74 987 0909z")                      #(T8)
    db.retrieve_row(5)                                              #(T9)
    db.interactive()                                               #(T10)
