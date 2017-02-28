// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author: Avinash Kak
//
// Chapter:     Chapter 2 -- Baby Steps
//
// Section:     Section 2.3 --- Simple Programs File I/O
//




//FileCopy.cc

#include <iostream>          // for cerr
#include <fstream>                                                //(A)
#include <cstdlib>
using namespace std;                                              //(B)

void print_error(const char*, const char* = "");                 //(C)

int main(int argc, char* argv[])                                  //(D)
{
    if (3 != argc)                                        
        print_error("usage: copy source dest"); 

    ifstream in( argv[1], ios::binary );                          //(E)
    if (!in)                                            
        print_error( "can't open", argv[1] );       
  
    ofstream out( argv[2], ios::binary );                         //(F)
    if (!out)                                              
        print_error( "can't open", argv[2] );      
  
    char ch;                                                      //(G)
    while ( in.get(ch) )                                          //(H)
        out.put( ch );                                            //(I)
        
    if ( !in.eof() )                                              //(J)
        print_error("something strange happened");          
    return 0;
}

void print_error(const char* p, const char* p2) {                 //(K)
    cerr << p << ' ' << p2 << '\n';                               //(L)
    exit(1);                                                      //(M)
} 
