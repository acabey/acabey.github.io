// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 20  Database Programming
//
// Section:     Section 20.5  Mysql++ Programming: Invoking SQL Through C++
//



//DBFriends1.cc

#include <iostream>
#include <sqlplus.hh>    
#include <iomanip>
using namespace std;

int main()
{
    try {
        Connection con( use_exceptions );
        con.connect( "test" );
        Query query = con.query();  
        query << "SET AUTOCOMMIT=1";
        query.execute();
        query << "DROP TABLE IF EXISTS Friends";
        query.execute();
        query << "DROP TABLE IF EXISTS Rovers";
        query.execute();

        // Friends table:
        query << "CREATE TABLE Friends ( Name CHAR (30) "
              << "PRIMARY KEY, Phone INT, Email CHAR(30) )";
        query.execute();
        query << "INSERT INTO Friends VALUES ( 'Ziggy Zaphod', "
              << "4569876, 'ziggy@sirius' )";
        query.execute();
        query << "INSERT INTO Friends VALUES ( 'Yo Yo Ma', "
              << "3472828, 'yoyo@yippy' )";
        query.execute();
        query << "INSERT INTO Friends VALUES ( 'Gogo Gaga', "
              << "27278927, 'gogo@garish' )" ;
        query.execute();

        // Rovers table:
        query << "CREATE TABLE Rovers ( Name CHAR (30) NOT NULL, "
              << "RovingTime CHAR(10) )";
        query.execute();
        query << "INSERT INTO Rovers VALUES ( 'Dusty Dodo', '2 pm' )";
        query.execute();
        query << "INSERT INTO Rovers VALUES ( 'Yo Yo Ma', '8 pm' )";
        query.execute();
        query << "INSERT INTO Rovers VALUES ( 'BeBe Beaut', '6 pm' )";
        query.execute();

        query << "SELECT Friends.Name, Rovers.RovingTime "
              << "FROM Friends, Rovers WHERE Friends.Name=Rovers.Name";

        // The result set:
        Result res = query.store();
        cout << "Query: " << query.preview() << endl; 
        cout << "Records Found: " << res.size() << endl << endl;

        Row row_rs;
        cout.setf(ios::left);
        Result::iterator i;
        for ( i = res.begin(); i != res.end(); i++ ) {
            row_rs = *i;
            int numFields = row_rs.size();
            if ( i == res.begin() ) {
                for ( int j = 0; j < numFields; j++ )
                    cout << setw( 17 ) << res.names( j ) << "\t\t";
                cout << endl << endl;
            }
            for ( int j = 0; j < numFields; j++ )
                cout << setw( 17 ) << row_rs[ j ] << "\t";   
            cout << endl;
        }          
    } catch ( BadQuery& er ) { 
        cerr << "Query Error: " << er.error << endl;
        return -1;                                                         
    } catch( BadConversion& er ) {
        cerr << "Conversion Error: Tried to convert \"" 
             << er.data << "\" to a \""
             << er.type_name << "\"." << endl;
        return -1;
    }
}
