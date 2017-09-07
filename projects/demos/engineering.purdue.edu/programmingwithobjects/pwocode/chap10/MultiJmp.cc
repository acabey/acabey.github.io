// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.1  Set JMP-Long JMP For Multilevel Return In C
//



//MultiJmp.cc

#include <iostream> 
#include <csetjmp> 
#include <cstdlib>
using namespace std;

static jmp_buf env;                                               //(A)
void f(int);

int main()
{
    // setjmp() in the following statement returns 0 when first
    // called. If longjmp() causes the control to return to the 
    // point defined by this statement, the value of ret is set 
    // to the second argument of longjmp.
    int ret = setjmp( env );                                      //(B)

    if (ret == 1) {                                               //(C)
        cout << "Maximum depth of recursion reached" << endl;
        exit(0);
    }
    f(0);

    return 0;
}
 
void f(int j) {
    cout << "function f called with j = " << j << endl;
    if (j == 3)      
        longjmp( env, 1 );                                        //(D)
    f( ++j );
}
