// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 4 ---- Strings
//
// Section:     Section 4.3.8 -- Size and Capacity
//





//StringSizeOf.cc


#include <iostream>
#include <string>
using namespace std;

int main()
{
  cout << sizeof( "hello" ) << endl;            // 6
  cout << sizeof( "hello there" ) << endl;      // 12

  string str1 = "hello";
  string str2 = "hello there";

  cout << sizeof( str1 ) << endl;               // 4 
  cout << sizeof( str2 ) << endl;               // 4 

  char* s1 = "hello";
  char* s2 = "hello there";

  cout << sizeof( s1 ) << endl;                 // 4
  cout << sizeof( s2 ) << endl;                 // 4
  
  char c_arr[] = "how are you?";
  cout << sizeof( c_arr ) << endl;              // 13

  return 0;
}
