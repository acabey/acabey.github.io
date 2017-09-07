
// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6 The Primitive Types and Their Input/Output
//
// Section:     Section 6.8.3  Input-Output Operations for Byte Streams
//




//WriteBinaryIntsToFile.cc

#include <iostream>                // for cerr
#include <fstream>
using namespace std;

int main() {
    ofstream out( "out.data", ios::binary);                
    if (!out)                                          
        cerr << "cannot open output file" << endl;

    int data[3] = {1, 2, 3};                                      //(A)
    out.write( (char*) data, sizeof( data ) );                    //(B)
    out.close();
    return 0;
}
