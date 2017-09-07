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



//DBFriends2.cc

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
        query << "DROP TABLE IF EXISTS SportsClub";
        query.execute();

        query << "CREATE TABLE Friends ( Name CHAR (30) PRIMARY KEY, " 
              << "Phone CHAR (15), Email CHAR(30), "
              << "Age TINYINT (3), Married BOOL, " 
              << "NumKids TINYINT (3), Sport CHAR(20) )";
        query.execute();

        query << "CREATE TABLE SportsClub (Name CHAR (30) PRIMARY KEY,"
              << "Age TINYINT (3), Sport CHAR(20), " 
              << "Level Char(20) )";
        query.execute();

        query << "LOAD DATA LOCAL INFILE 'Friends.txt' "
              << "INTO TABLE Friends"; 
        query.execute();         
        query << "LOAD DATA LOCAL INFILE 'SportsClub.txt' INTO "
              << " TABLE SportsClub"; 
        query.execute();         

        // which of the Friends also play tennis at the club:
        query << "SELECT Friends.Name, SportsClub.Level FROM Friends, "
              << "SportsClub WHERE " 
              << "Friends.Name = SportsClub.Name AND "
              << "Friends.Sport = SportsClub.Sport AND "
              << "Friends.Sport = 'tennis' ";

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
