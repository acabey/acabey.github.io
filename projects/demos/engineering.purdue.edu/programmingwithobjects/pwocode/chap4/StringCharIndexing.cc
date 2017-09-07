// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 4 ---- Strings
//
// Section:     Section 4.3.2 - Accessing Individual Characters
//




// StringCharIndexing.cc

#include <string>
using namespace std;

int main()
{
    string str( "hello" );
    char ch = str[0];             // ch initialized to 'h'
    str[0] = 'j';                 // str now equals "jello"
    ch = str.at( 0 );             // ch's value is now 'j'
    str.at(0) = 'h';              // str agains equals "hello"
    ch = str[ 1000 ];             // garbage value for ch
    //  ch = str.at( 1000 );      // program aborts if uncommented
    return 0;
}
