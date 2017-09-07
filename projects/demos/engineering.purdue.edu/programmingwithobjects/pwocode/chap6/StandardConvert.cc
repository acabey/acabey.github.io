// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6  ----  The Primitive Types and Their Input/Output
//
// Section:     Section 6.7.1  ----  Implicit Type Conversions in C++
//



//StandardConvert.cc

#include <iostream>
using namespace std;

void g1(short x) {cout << "short version invoked   x: " << x << endl;}
void g2( int x ) { cout << "int version invoked  x: "<< x << endl; }
void g3( float x ) {cout << "float version invoked  x: "<< x << endl;} 
float  g4( int x ) { 
    cout << "standard conversion to match return type" << endl;
    return x;
}

int main()
{
    char ch = 'a';

    //standard conversion in initialization:
    float x = ch;           
 
    long j;

    //standard conversion in assignment:
    j = x;                  

    cout << j << endl;      // output: 97                         //(A)

    int i = 1234567890;

    //standard conversion from int to float:
    float fi = i;           

    //error in converting int to float:
    cout << i - (int) fi << endl;      // output: -46             //(B)

    //value too large to fit into an int:
    float  y = 1e20f;                                      

    //value too large to fit into a float:
    double z = 1e100;      

    //standard-convert float into a short for function invocation:
    g1( y );     // output:  short version invoked   x: -32768    //(C)

    //standard-convert float into an int for function invocation:
    g2( y );     // output:  int version invoked  x: -2147483648  //(D)

    //standard-convert double into a float for function invocation:
    g3( z );     // output:  float version invoked  x: inf        //(E)

    //standard-convert returned value to return type inside g4:
    float w = g4( i );    
            // output: standard convert to match return type      //(F)
 
    //error in returned value:
    cout << i - (int) w << endl;  // output:  -46                 //(G)
  
    return 0;
}
