// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.7  Smart Pointers: Overloading Of Dereferencing Operators
//




//PretendGiant.cc

class Giant{};

class Big {};

class MyClass {
    Giant* giant;
    Big* big;
public:
    MyClass()
        : giant( new Giant() ),                                   //(A)       
          big( new Big() )                                        //(B)
    {}

    ~MyClass() { delete giant; delete big; }
};

int main() 
{ 
    MyClass myobject;                                             //(C)
    return 0;
}
