// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author: Avinash Kak
//
// Chapter:     Chapter 2 -- Baby Steps
//
// Section:     Section 2.2 --- Simple Programs: Terminal I/O
//




//TermIO.cc

#include <iostream>
using namespace std;

int main() 
{
    int sum = 0;                              
    cout << "Enter a sequence of integers: "; 
    int i;                                    
    while ( cin >> i ) {                                          //(A)
        sum += i;                                       
        while ( cin.peek() == ' ' ) cin.get();                    //(B)
        if ( cin.peek() == '\n' ) break;                          //(C)
    }
    cout << "Sum of the numbers is: " << sum << endl;
    return 0;
}    
