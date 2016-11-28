// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.8  Destructors In C++
//



//DestructorNecessary.cc

#include <iostream>
using namespace std;

class X {
public:
    int* ptrToArray;                                         
    int size;                                          

    X( int* ptr, int sz ) : size(sz) {                            //(A)
        ptrToArray = new int[size];                               //(B)
        for ( int i = 0; i < size; i++ ) ptrToArray[i] = ptr[i];  //(C)
    }

    ~X() {                                                        //(D)
        cout << "hello from the destructor" << endl;     
        delete [] ptrToArray;                                     //(E)
    }
};

int main()                                           
{
    int freshData[100] = {0};                          
    X xobj( freshData, 100 );                                     //(F)
    X* p = new X( freshData, 100 );                               //(G)       
    delete p;                                                     //(H)   
    return 0;
}
