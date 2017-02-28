// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 6 The Primitive Types and Their Input/Output
//
// Section:     Section 6.8.3  Input-Output Operations for Byte Streams
//








//BinaryFileIO.cc

#include <iostream>               // for cerr
#include <fstream>
#include <cstdlib>
using namespace std;

const int N = 1000;

void print_error(const char* p1, const char* p2 = 0);

int main(int argc, char* argv[]) 
{
    char buffer[ N ];

    if (3 != argc)                                    
        print_error("wrong number of arguments --- "
              "usage: function input_file output_file");

    ifstream in( argv[1], ios::binary);                
    if (!in) print_error( "cannot open input file", argv[1] );   

    ofstream out( argv[2], ios::binary);                
    if (!out) print_error( "cannot open output file", argv[2] );

    while( in.read( buffer, N ) )                                 //(A)
        out.write( buffer, N );                                   //(B)

    if ( in.eof() ) {                                             //(C)
        int count = in.gcount();                                  //(D)
        out.write( buffer, count );                               //(E)
    }

    if ( !in.eof() ) print_error("something strange happened");   //(F)

    in.close();
    out.close();
    return 0;
}

void print_error(const char* p1, const char* p2) {
    if ( p2 ) cerr << p1 << ' ' << p2 << endl;                
    else cerr << p1 << endl;
    exit(1);
} 
