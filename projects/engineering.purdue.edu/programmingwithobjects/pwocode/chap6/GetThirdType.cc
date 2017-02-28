// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6 The Primitive Types and Their Input/Output
//
// Section:     Section 6.8.2  Input-Output Operations for Character Streams
//




//GetThirdType.cc

#include <iostream>          // for cout
#include <fstream>
using namespace std;

int main() {
    const int max_count = 256; 
              // will read max of 255 bytes to 
              // allow for null at the end    

    char line[ max_count ]; 

    ifstream in( "a.out" );

    while ( in.get( line, max_count ) ) {                     //(A)
        int count = in.gcount();                              //(B)
        cout << "num of bytes read:" << count << '\n';        
        if ( count < max_count - 1 ) in.ignore();             //(C)
    }
    return 0;
}
