// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6  The Primitive Types and Their Input/Output
//
// Section:     Section 6.8.2  Input-Output Operations for Character Streams
//




//TestFilePosition.cc

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {
    fstream inout( "invoice.dat", ios::in | ios::out );           //(A)

    //write to the file:
    inout << 1234 << "   "  << 56.78 << "  " << "apples" << '\n'; //(B)
    //current get position: 
    cout << inout.tellg() << endl;               // 21            //(C)
    //current put position:
    cout << inout.tellp() << endl;               // 21            //(D)

    //reset get position to the beginning of the file:
    inout.seekg( ios::beg );                                      //(E)
    //new get position: 
    cout << inout.tellg() << endl;               // 0             //(F)
    //new put position:
    cout << inout.tellp() << endl;               // 0             //(G)

    int x;
    double y;
    string z;

    //read from file:
    inout >> x >> y;                                              //(H)
    inout >> z;                                                   //(I)

    cout << x << " " << y << " " << z << endl;                    //(J)
                                  // 1234 56.78 apples
    return 0;
}
