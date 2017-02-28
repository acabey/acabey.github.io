// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.10 - Namespaces In C++
//



//Namespaces4.cc

#include <iostream>
using namespace std;

namespace Module1 {
    typedef int Type;
    Type foo( Type arg ) { return arg; }
}

namespace Module2 {
    typedef double Type;
    Type foo( Type arg ) { return arg; }
}

int main() 
{
    {
        using namespace Module1;
        Type x = 100;                      // int
        cout << foo( x ) << endl;          // 100
    }
    {
        using namespace Module2;
        Type x = 3.14;                     // double
        cout << foo( x ) << endl;          // 3.14
    }
    {
        using Module1::foo;
        cout << foo( 100 ) << endl;        // 100
    }
    {
        using Module2::foo;
        cout << foo( 3.14) << endl;        // 3.14
    }
    return 0;
}
