// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Ideas
//
// Section:     Section 3.10 - Namespaces In C++
//




//Namespaces.cc

#include <string>
#include <iostream>
using namespace std;                                              //(A)

namespace Module1 {
    void foo();         // this is only a declaration,
                        // definition will come later in line (D)
}

namespace Module2 {
    void foo() { cout << "Module2 foo() invoked" << endl; }
}

namespace Module3 {
    using namespace Module1;    // has 'foo'                      //(B)
    using namespace Module2;    // also has 'foo', but            //(C)
                                // no problem at this point
    void bar() { cout << "Module3 bar() invoked" << endl; }
}

namespace Module4 {
    void foo() { cout << "Module4 foo() invoked" << endl; }
}

namespace Module5 {
    void bar() { cout << "Module5 bar() invoked" << endl; }
}

// foo of Module1 defined outside the namespace Module1. Must
// therefore use namespace-qualified name for foo:
void Module1::foo() {cout << "Module1 foo() invoked" << endl;}    //(D)

// The global foo:
void foo() { cout << "top level foo() invoked" << endl; }

//Addition to Module5:
namespace Module5 {   
    void hum() { cout << "Module5 hum() invoked" << endl; }
}


int main() {
    //This statement invokes global foo()
    foo();                                                        //(E)

    Module1::foo();                                               //(F)
    Module2::foo();                                               //(G)

    //The following statement, if uncommented, results 
    //in compiler error because Module1 and Module2 
    //both have foo()
    //  Module3::foo();                                           //(H)

    Module3::bar();                                               //(I)

    using namespace Module4;    

    //The following statement, if uncommented, results 
    //in compiler error because foo() of Module4 
    //conflicts with the global foo() 
    //  foo();                                                    //(J)
               
    //But the following statement is okay since it uses 
    //the scope operator for invoking the global foo()
    ::foo();                                                      //(K)
                            
    using namespace Module5;
    bar();                                                        //(L)
    hum();                                                        //(M)
    return 0;
}
