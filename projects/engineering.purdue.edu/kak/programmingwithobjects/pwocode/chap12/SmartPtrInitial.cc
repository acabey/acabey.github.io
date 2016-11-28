// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.7  Smart Pointers: Overloading Of Dereferencing Operators
//



//SmartPtrInitial.cc

#include <iostream>
using namespace std;

class X {};

class SmartPtr {
    X* ptr;
public:
    SmartPtr( X* p ) : ptr( p ) {};    
    X& operator*() { return *ptr; }    
    X* operator->() { return ptr; }    

    ~SmartPtr() { 
        delete ptr; 
        cout << "Memory pointed to by ptr freed up" << endl;
    }    
};

int main()
{
    X* xp = new X();
    SmartPtr s( xp );
    
    return 0;
}
