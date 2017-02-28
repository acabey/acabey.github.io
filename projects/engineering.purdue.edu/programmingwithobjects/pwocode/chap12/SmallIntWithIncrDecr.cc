// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++	
//
// Section:     Section 12.8  Overloading Increment And Decrement Operators
//



//SmallIntWithIncrDecr.cc

#include <iostream>
#include <cstdlib>
using namespace std;

class SmallInt {
    int value;
    class Err {};
    int rangeCheck( int i ) throw( Err );
public:  
    explicit SmallInt( int ival = 0 );                            //(A)      
    SmallInt( const SmallInt& other );
    SmallInt& operator=( const SmallInt& other );
    SmallInt& operator=( const int i );
    //unsafe implicit conversion:
    operator int() const { return value; }                        //(B)
    SmallInt& operator++();
    SmallInt& operator--(); 
    const SmallInt operator++(int);
    const SmallInt  operator--(int); 
    friend ostream& operator<<( ostream& os, const SmallInt& s );
}; 

//constructor:
inline SmallInt::SmallInt( int ival ) {
    try {
        value = rangeCheck( ival );
    } catch (Err) {
        cerr << "Error: Range of SmallInt violated" << endl;
        exit( 1 );
    }
}

//copy constructor:
inline SmallInt::SmallInt( const SmallInt& other ) {
    value = other.value;
}    

//copy assignment operator:
inline SmallInt& SmallInt::operator=( const SmallInt& other ) {
    if ( this != &other ) 
        value = other.value;
    return *this;
}

//assignment from an int:
inline SmallInt& SmallInt::operator=( const int i ) { 
    try {
        value = rangeCheck( i ); 
    } catch(Err) {
        cerr << "Error: Range of SmallInt violated" << endl;
        exit( 1 );
    }
    return *this;
}

//prefix increment operator:
inline SmallInt& SmallInt::operator++() { 
    try {
        rangeCheck( ++value );
    } catch(Err) {
        cerr << "Error: Range of SmallInt violated" << endl;
        exit( 1 );
    }
    return *this;
}

//prefix decrement operator:
inline SmallInt& SmallInt::operator--() { 
    try {
        rangeCheck( --value );
    } catch(Err) {
        cerr << "Error: Range of SmallInt violated" << endl;
        exit( 1 );
    }
    return *this;
}

//postfix increment operator:
inline const SmallInt SmallInt::operator++(int) { 
    SmallInt oldValue = *this;
    ++(*this);
    return oldValue;
}

//postfix decrement operator:
inline const SmallInt SmallInt::operator--(int) { 
    SmallInt oldValue = *this;
    --(*this);
    return oldValue;
}  

//range check function:
inline int SmallInt::rangeCheck( int i ) throw( Err ) {
    if ( i < 0 || i > 255 )
        throw Err();  
    return i;
}

//overload for the output stream operator:
ostream& operator<<( ostream& os, const SmallInt& s ) {
    os << s.value;
    return os;
}

int main()
{
    SmallInt si( 3 );
    cout << si + 3.14159 << endl;    // 6.14159
    cout << ++si << endl;            // 4
    cout << si++ << endl;            // 4
    cout << si << endl;              // 5
    cout << --si << endl;            // 4
    cout << si << endl;              // 4
    cout << si-- << endl;            // 4
    cout << si << endl;              // 3

    si = 255;
    cout << si << endl;
    //  si++;                   // range violated, exception thrown       
    //  si = 300;               // range violated, exception thrown

    cout <<  si + 400 << endl;                                    //(C)       
                                // 655  (shows the dangers of 
                                // implicit conversion)
    return 0;
}
