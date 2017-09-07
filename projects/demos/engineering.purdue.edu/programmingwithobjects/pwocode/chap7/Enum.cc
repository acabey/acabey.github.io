// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.13  The Enumeration Type In C++
//






//Enum.cc

#include <iostream>
using namespace std;

class X {
public:
    enum weight {light, medium, heavy, very_heavy};               //(A)
    enum {d1 = 3, d2 = 5};                                        //(B)
    int x;                                                        
    weight wx;                                          
    X( int i, int j ) {x = i + d1; wx = (weight) (j + medium) ;}  //(C)  
};

enum {c1=17, c2 =19};                 //global                    //(D)

enum height {tall, very_tall};        //global                    //(E)

int main() 
{
    X obj1(100, 200);                                             //(F)
    cout << obj1.x  << "  "           // 103                      //(G)
         << obj1.wx <<  endl;         // 201                      //(H)
  
    //  X obj2(100, light);           // ERROR                    //(I)
  
    int y = c1;                                                   //(J)
    cout << y << endl;                // 17                       //(K)
  
    height h;                                                     //(L)
    h = tall;                                                     //(M)
    cout << h << endl;                // 0                        //(N)

    return 0;
}
