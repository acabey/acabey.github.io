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



//DestructWhenNot.cc

class X {
public:
    int* ptrToArray;
    int size;
    X( int* ptr, int sz ) : size(sz) { 
        ptrToArray = new int[size];
        for ( int i = 0; i < size; i++ ) ptrToArray[i] = ptr[i];
    }
    ~X() { delete [] ptrToArray; }
};

int main()
{
    int freshData[100] = {0};
    X* p1 = new X( freshData, 100 );
    X* p2 = new X( freshData, 100 );
    delete p1;                                                    //(A)
    delete p1;                                  // ERROR          //(B)
    return 0;
}
