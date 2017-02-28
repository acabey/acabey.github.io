// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 4 ---- Strings
//
// Section:     Section 4.3.8 -- Size and Capacity
//




//StringSize.cc


#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str = "0123456789";

    cout << "The current capacity of the string is: "
         << str.size() << endl;                          // 10
    str.resize( 20 );

    cout << "The new capacity of the string is: "
         << str.size() << endl;                          // 20

    cout << "The actual length of the string is: "       // 10
         << strlen( str.c_str() ) << endl;         

    cout << "The string object after resizing "
         << "to 20 a 10 character string: "
         << str << endl;                     // "0123456789"
    str += "hello";
    cout << str << endl;                     // "0123456789hello"

    return 0;
}
