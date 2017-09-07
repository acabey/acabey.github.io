// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6  The Primitive Types and Their Input/Output
//
// Section:     Section 6.8.3  Input-Output Operations for Byte Streams
//




//BinaryFileIO2.cc

#include <iostream>                   // for cerr
#include <fstream>
#include <cstdlib>
using namespace std;

void print_error(const char* p1, const char* p2 = 0);

int main(int argc, char* argv[]) 
{
    if (3 != argc)                                    
        print_error("wrong number of arguments --- "
              "usage: function input_file output_file");

    //the ios::ate option below places the get-position pointer 
    //at the end of the file, thus enabling tellg() to return 
    //the size of the file:
    ifstream in( argv[1], ios::binary | ios::ate );               //(A)
    if (!in) print_error( "cannot open input file", argv[1] );   

    //the size of the file in bytes:
    long N = in.tellg();                                          //(B)

    char buffer[N];                                               //(C)

    //reset get-position pointer:
    in.seekg( ios::beg );                                         //(D)

    ofstream out( argv[2], ios::binary);                          //(E)
    if (!out) print_error( "cannot open output file", argv[2] );

    //file copy in one fell swoop:
    in.read( buffer, N );                                         //(F)
    out.write( buffer, N );                                       //(G)

    if ( !in.good() ) {
        print_error("something strange happened");   
        exit( 1 );
    }

    in.close();
    out.close();
    return 0;
}

void print_error(const char* p1, const char* p2) {
    if ( p2 ) cerr << p1 << ' ' << p2 << endl;                
    else cerr << p1 << endl;
    exit(1);
} 
