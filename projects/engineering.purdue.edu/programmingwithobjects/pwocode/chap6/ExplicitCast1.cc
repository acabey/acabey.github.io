// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6    The Primitive Types and Their Input/Output
//
// Section:     Section 6.7.3  Explicit Type Conversion in C++
//




//ExplicitCast1.cc

#include <iostream>
using namespace std;

int main()
{
    char ch, ch_prev;

    while (1) {
        cout << "Enter a character: " ;
        cin >> ch;
        if ( ch == ch_prev ) break;                               //(A)      
        ch_prev = ch;
        cout << "Integer value of the character is: " 
             << static_cast<int>(ch) << endl;                     //(B)
    }
    return 0;
}
