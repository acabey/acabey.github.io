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






//TestFilePosition2.cc

#include <iostream>                // for cout
#include <fstream>
#include <string>
using namespace std;

int main() {
    fstream inout( "invoice.dat", ios::in | ios::out );           

    //write to the file:
    inout << 1234 << "   "  << 56.78 << "  " << "apples" << '\n';

    //current get position: 
    cout << inout.tellg() << endl;               // 21
    //current put position:
    cout << inout.tellp() << endl;               // 21

    //reset:
    inout.seekg( 0 );
    //new get position:
    cout << inout.tellg() << endl;               // 0
    //new put position:
    cout << inout.tellp() << endl;               // 0

    int x = 0;                                                    //(K)
    double y = 0.0;                                               //(L)
    string z = "";                                                //(M)

    //read first item from file:
    inout >> x;                                                   //(N)

    //move the stream 8 positions to the right of the 
    //current get position: (this will cause the stream 
    //to skip over the number 56.78)
    inout.seekg( 8, ios::cur );                                   //(O)

    //read next item from file:
    inout >> z;                                                   //(P)
 
    cout << x << " " << y << " " << z << endl;                    //(Q)
                                    // 1234  0  apples
    return 0;
}
