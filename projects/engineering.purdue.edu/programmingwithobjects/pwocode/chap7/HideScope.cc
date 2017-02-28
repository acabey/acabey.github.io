// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.7  Scope Of An Identifier In C++
//




//HideScope.cc

int x;                 // global x

void f() {
    int x;             // local x hides global x
    x = 1;             // assigns to local x
    {
        int x;         // hides first local x
        x = 2;         // assigns to second local x
        ::x = 20;      // assigns to global x
    }
    x = 3;             // assigns to first local x
}

int main()
{
    int* p = &x;       // take address of global x
    return 0;
}
