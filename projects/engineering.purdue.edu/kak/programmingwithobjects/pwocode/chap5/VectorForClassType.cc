// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5  ----  Using the COntainer Classes
//
// Section:     Section 5.1.1.2 ----  Vector of Class Type Objects
//



//VectorForClassType.cc

#include <iostream>
#include <vector>  
#include <algorithm>         // for sort()
using namespace std;

class X {                                                         //(A)
    int p;
public:
    X() { p = 42; }
    X( int q ) { p = q; }
    int getp() const { return p; }
    void changeState( int pp ) { p = pp; }
};

//Chapter 12 explains the syntax shown for the two
//operator overloadings for class X:
bool operator<( const X& x1, const X& x2 ) {                      //(B)
        return x1.getp() < x2.getp();
}
bool operator==( const X& x1, const X& x2 ) {                     //(C)
        return x1.getp() == x2.getp();
}

// An alternative way of sorting a vector of objects
// of type X would be to invoke a 3-argument sort with
// the third argument set to the function object
// X_Comparator(). This function object would correspond
// to the overloading of the '()' operator.  See Chapter
// 12 for the overloading of this operator.
// class X_Comparator {                                           //(D)
// public:
//    bool operator() ( const X& x1, const X& x2 ) const {        //(E)
//        return x1.getp() < x2.getp();                       
//    }                                                       
// };

void print( vector<X> );

int main()
{
    vector<X> vec;                                                //(F)
 
    X x1( 2 );                                                    //(G)
    X x2( 3 );                                                    //(H)
    X x3( 5 );                                                    //(I)

    vec.push_back( x1 );
    vec.push_back( x3 );
    vec.push_back( x2 );

    print( vec );                        // 2 5 3
    x2.changeState( 1000 );                                       //(J)

    //change made to x2 in line (J) does not affect copy of x2 in vec:
    print( vec);                         // 2 5 3

    //vector elements initialized by X's no-arg constructor:
    vector<X> vec_2( 5 );                                         //(K)
    print( vec_2 );                  // 42 42 42 42 42
    vec_2.resize( 7 );                                            //(L)
    print( vec_2 );               // 42 42 42 42 42 42 42

    //uninitialized increase in the vector capacity:
    vec_2.reserve( 10 );                                          //(M)
    cout << vec_2.capacity() << endl;    // 10
    print( vec_2 );               // 42 42 42 42 42 42 42
                                  // size still returns 7
    cout << vec_2[ 8 ].getp() << endl;   // undefined             //(N)

    //set up vector for sorting:
    vec_2[0] = X(12);
    vec_2[1] = X(36); 
    vec_2[2] = X(3); 
    vec_2[3] = X(56); 
    vec_2[4] = X(2); 

    sort( vec_2.begin(), vec_2.end() );                           //(O)

    // The commented out statement in line (P) below is an 
    // alternative way of sorting a vector of objects of 
    // type X.  In the 3-argument invocation of sort, the 
    // third argument is a function-object that corresponds 
    // to the overloading of the '()' operator for the 
    // X_Comparator class.  This overloading was shown earlier 
    // in the commented out line (E).
    //  sort( vec_2.begin(), vec_2.end(), X_Comparator() );       //(P)

    print( vec_2 );               // 2 3 12 36 42 42 56

    vec_2.clear();                        
    print( vec_2 );                       // vec_2 is now empty
    cout << vec_2.capacity() << endl;     // 10

    return 0;
}

void print( vector<X> v ) {
    cout << "\nvector size is: " << v.size() << endl;
    vector<X>::iterator p = v.begin();
    while ( p != v.end() )
        cout << (*p++).getp() << "  ";                        
    cout << endl << endl;
}

