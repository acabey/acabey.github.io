// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Authors:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.16 - Nested Types
//




//NestedTypes.cc

class X {};

class Y {
public:
    typedef X Z;                                                  //(A)
    enum Weight { light, medium, heavy };                         //(B)
private:
    Z zobj;
    Weight weight;
};

int main() {
    // Z zobj;                      // error
    Y::Z zobj;                      // ok
    // Weight w = medium;           // error
    // Y::Weight w = medium;        // error
    Y::Weight w = Y::medium;        // ok
    return 0;
}
