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



// NamespaceNested.cc

#include <iostream>
#include <string>
using namespace std;

namespace N1 {
    typedef int Type;
    namespace N2 {
        typedef int* Type;
        namespace N3 {
            typedef string Type;
            namespace N4 {
                typedef string* Type;
            }
        }
    }
}

int main()
{
    using namespace N1;

    Type x = 10;                            // Type is int
    cout << x << endl;                      // 10

    N1::N2::Type p = &x;                    // Type is int*
    cout << *p << endl;                     // 10

    N1::N2::N3::Type str( "hello" );        // Type is string
    cout << str << endl;                    // "hello"

    N1::N2::N3::N4::Type q = &str;          // Type is string*
    cout << *q << endl;                     // "hello"

    namespace N_FOUR = N1::N2::N3::N4;      // namespace alias    //(A)
    N_FOUR::Type ptr = &str;              
    cout << *ptr << endl;                   // "hello"

    return 0;
}
