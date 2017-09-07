// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6  ----  The Primitive Types and Their Input/Output
//
// Section:     Section 6.4  ----  Character Types
//





//CharEscapes.cc

#include <iostream>
#include <string>
using namespace std;

int main()
{
    string y1( "a\x62" );           
    cout << y1 << endl;            // y1 is string "ab".
                                   // Printed output:  ab
    string y2( "a\x0a" );           
    cout << y2 << endl;            // y2 is the string formed by
                                   // the character 'a' followed
                                   // by the newline character
                                   // Printed output:   a

    string y3( "a\nbcdef" );        
    cout << y3 << endl;            // y3 is the string formed by
                                   // the character 'a' followed
                                   // by the newline character
                                   // represented by the character
                                   // escape '\n' followed by the 
                                   // characters 'b', 'c', 'd', 'e',
                                   // and 'f'.
                                   // Printed output:   a
                                   //                   bcdef

    string y4( "a\x0awxyz" );       
    cout << y4 << endl;            // y4 is the string formed by
                                   // character 'a' followed by the
                                   // newline character represented by
                                   // the numerical escape in hex, '\x0a',
                                   // followed by the characters 'w', 
                                   // 'x', 'y', and 'z'.
                                   // Printed output:  a
                                   //                  wxyz

//  string y5( "a\x0abcdef" );     // ERROR  
//  cout << y5 << endl;            // because the number whose hex 
                                   // representation is '0abcdef' is 
                                   // out of range for a char
                                   
    string y6( "a\xef" );           
    cout << y6 << endl;            // Correct but the character after
                                   // 'a' may not be printable

    string w1( "a\142" );           
    cout << w1 << endl;            // w1 is the string formed by 
                                   // the character 'a' followed by
                                   // the character 'b'.
                                   // Printed output: ab

    string w2( "a\142c" );          
    cout << w2 << endl;            // w2 is the string formed by the
                                   // character 'b' followed by the
                                   // character 'c'.
                                   // Printed output: abc
    string w3( "a\142142" );        
    cout << w3 << endl;            // w3 is the string formed by the
                                   // character 'a' followed by the
                                   // character 'b' followed by the
                                   // characters '1', '4', and '2'.
                                   // Printed output: ab142

    string w4( "a\79" );           
    cout << w4 << endl;            // w4 is the string formed by the
                                   // character 'a' followed by the 
                                   // bell character, followed by 
                                   // the character '9'.  Printed
                                   // output: a9

    string w5( "\x00007p\x0007q\x0007r\x007s\x07t\x7u" );           
    cout << w5 << endl;            // printed output: pqrstu

    return 0;
}
