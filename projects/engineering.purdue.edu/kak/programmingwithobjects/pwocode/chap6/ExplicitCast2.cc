// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6   The Primitive Types and Their Input/Output
//
// Section:     Section 6.7.3   Explicit Type Conversion in C++
//



//ExplicitCast2.cc

#include <iostream>
using namespace std;

int main( )
{
      int i1 = 312;
      int i2 = -255;
      int i3 = 32768;

      cout << i1  << ": " << "cast to short is "
           <<  static_cast<short>(i1)  << ",  cast to char is " 
           << static_cast<int>( static_cast<char>(i1) ) << endl;

      cout << i2  << ": " << "cast to short is " 
           <<  static_cast<short>(i2)  << ",  cast to char is " 
           <<  static_cast<short>( static_cast<char>(i2) ) << endl;

      cout << i3  << ": " << "cast to short is " 
           <<  static_cast<short>(i3)  << ",  cast to char is " 
           <<  static_cast<int>( static_cast<char>(i3) ) << endl;

      return 0;
}    
