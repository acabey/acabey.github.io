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




//Promo.cc

#include <iostream>
using namespace std;

void g1(short x) {cout << "short version invoked   x: " << x << endl;}
void g2(long x) { cout << "long version invoked  x: "<< x << endl; }
int  g3(short x) { 
    cout << "promotion to match return type" << endl;
    return x;
}

int main()
{
    //promotion in initialization:
    char ch = 'a';
    int x = ch;             
 
    //promotion in assignment:
    long j;
    j = x;                  
    cout << j << endl;       //output: 97                         //(A)

    //promote char into a short for function invocation:
    g1( ch );          //output: short version invoked x:97       //(B)
                            
    //promote int into a long for function invocation:
    g2( x );           //output: long version invoked x:97        //(C)
 
    short s = 16;

    //promotion inside g3 when matching returned value to return type:
    int w = g3( s );   //output: promotion to match return type   //(D)

    return 0;
}
