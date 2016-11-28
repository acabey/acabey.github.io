
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








//BinaryFileIO3.cc

#include <iostream>                   // for cerr
#include <fstream>
using namespace std;

int main() {
    ofstream out( "out.data", ios::binary);                       //(A)
    if (!out)                                          
        cerr << "cannot open output file" << endl;

    int data[3] = {1, 2, 3};                                      //(B)

    out.write( (char*) data, sizeof( data ) );                    //(C)
    out.close();                                                  //(D)

    //the ios::ate option places the get-position
    //pointer at the end of the file, thus enabling
    //tellg() to return the size of the file:
    ifstream in( "out.data", ios::binary | ios::ate );            //(E)
    if (!in)
        cerr << "cannot open input file" << endl;

    //get size of the file in bytes:
    long size = in.tellg();                                       //(F)

    //reset get-position pointer:
    in.seekg( ios::beg );                                         //(G)

    int buffer[ size/4 ];                                         //(H)

    in.read( (char*) buffer, size );                              //(I)

    cout << buffer[0] << " " 
         << buffer[1] << " " 
         << buffer[2] << endl;   //output:  1   2   3             //(J)

    in.close();
    return 0;
}
