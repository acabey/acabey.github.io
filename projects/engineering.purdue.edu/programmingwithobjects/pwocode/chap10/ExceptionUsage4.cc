// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.3  Some Usage Patterns For Exception Handling In C++
//



//ExceptionUsage4.cc

#include <iostream>
using namespace std;

class MyException {};
class Err {};

void f( int j ) throw( MyException, Err ) {                       //(A) 
    if ( j == 1 ) throw MyException(); 
    if ( j == 2 ) throw Err(); 
}

int main()
{
    try {
        f( 1 );
    } catch( MyException ) { 
        cout << "caught MyException -- arg must be 1" << endl; 
    } catch( Err ) { 
        cout << "caught Err -- arg must be 2" << endl;
    }

    try {  
        f( 2 );
    } catch( MyException ) { 
        cout << "caught MyException -- arg must be 1" << endl; 
    } catch( Err ) { 
        cout << "caught Err -- arg must be 2" << endl; 
    }

    return 0;
}
