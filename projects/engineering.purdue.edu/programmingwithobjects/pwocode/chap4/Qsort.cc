// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 4 ---- Strings
//
// Section:     Section 4.3.3 - String Comparison
//




//Qsort.cc

#include <iostream>
#include <string>
using namespace std;

int compareStrings( const void* arg1, const void* arg2 );
int checkUpperCase( string buffer );

int main() 
{
    string wordList[] = {"hello", "halo", "jello", "yellow", 
                         "mellow", "Hello", "JELLO", "Yello", 
                         "MELLOW"};

    cout << sizeof( wordList ) << endl;           // 36

    int sizeArray = sizeof( wordList ) / sizeof( wordList[ 0 ] );
    cout << sizeArray << endl;                    // 9

    qsort( wordList, sizeArray , sizeof(string), compareStrings);

    int j = 0;
    while ( j < sizeArray )
        cout << wordList[j++] << " ";
             //Hello JELLO MELLOW Yello halo hello jello mellow yellow 
    cout << endl;
    return 0;
}

int compareStrings( const void* arg1, const void* arg2 ) {
    return ( *( static_cast<const string*>( arg1 ) ) ).compare( 
                        *( static_cast<const string*>( arg2) ) );
}
