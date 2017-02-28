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



//Namespaces3.cc

#include <iostream>
using namespace std;

namespace Module1 {
    class X {};
}

namespace Module2 {
    void foo(){ cout << "foo of Module2 invoked" << endl; }
    void bar(){ cout << "bar of Module2 invoked" << endl; }
}

namespace Module3 {
    using namespace Module1;
    typedef X Y;
    using Module2::foo;
    class Z {};
}

int main() 
{
    Module3::X x;
    Module3::Y y;
    Module3::foo();
    //  Module3::bar();       // ERROR.  No bar in Module3.
    return 0;
}
