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



//Namespaces2.cc

namespace Module1 {
    class X {};
    class Y {};
}

namespace Module2 {
    class X {};
    class Y {};
}

int main() {
    using Module1::X;                                             //(A)
    X x1;
    // using Module2::X;        // ERROR, name conflict           //(B)
    X x2;                 
    return 0;
}
