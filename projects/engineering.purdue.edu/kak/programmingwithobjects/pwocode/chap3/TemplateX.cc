// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.15 - Template Classes
//


//TemplateX.cc

#include <string>
#include <iostream>
using namespace std;

template <class T> class X {
    T datum;
public:
    X( T dat ) : datum( dat ) {}
    T getDatum(){ return datum; }
};

int main()
{
    int x = 100;
    X<int> xobj_1( x );

    double d = 1.234;
    X<double> xobj_2( d );

    string str = "hello";
    X<string> xobj_3( str );

    string ret1 = xobj_3.getDatum();
    cout << ret1 << endl;                    // output: ``hello''

    return 0;
}
