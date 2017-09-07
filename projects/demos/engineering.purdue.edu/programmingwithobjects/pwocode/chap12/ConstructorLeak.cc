// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operations In C++
//
// Section:     Section 12.7  Smart Pointers: Overloading Of Dereferencing Operators
//



//ConstructorLeak.cc

class Err{};

class Giant{};

class Big {
public:
    Big() throw( Err ) { throw Err(); }                           //(D)       
};

class MyClass {
    Giant* giant;
    Big* big;
public:
    MyClass() : giant( new Giant() ), big( new Big() ) {}         //(E)
    ~MyClass() { delete giant; delete big; }
};

int main()
{
    try {
        MyClass myobject;                                         //(F)
    } catch( Err ) {}
    return 0;
}
