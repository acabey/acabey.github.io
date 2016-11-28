// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 4 ---- Strings
//
// Section:     Section 4.3.5 -- Searching for Substrings and Characters
//



//StringFind.cc

#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str( "one hello is like any other hello" );
    string searchString( "hello" );
    string replaceString( "armadillo" );

    assert( searchString != replaceString );

    string::size_type pos = 0;
    while ( (pos = str.find(searchString, pos)) != string::npos ) {  
        str.replace( pos, searchString.size(), replaceString );
        pos += replaceString.size();
    }
    cout << str << endl;   //one armadillo is like any other armadillo
    return 0;
}
