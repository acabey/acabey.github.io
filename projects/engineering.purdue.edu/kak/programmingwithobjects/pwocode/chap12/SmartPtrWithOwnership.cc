// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.7  Smart Pointers: Overloading Of Dereferencing Operators
//



//SmartPtrWithOwnership.cc

class X {};

class SmartPtr {
    X* ptr;
public:
    explicit SmartPtr( X* p = 0 ) : ptr( p ) {};                  //(A)
    X& operator*() { return *ptr; }    
    X* operator->() { return ptr; }    

    SmartPtr( SmartPtr& other ) : ptr( other.release() ) {}

    SmartPtr operator=( SmartPtr& other ) {
        if ( this != &other )
            reset( other.release() );
        return *this;
    }

    ~SmartPtr() { delete ptr; }    

    X* release() { 
       X* oldPtr = ptr;
       ptr = 0;
       return oldPtr;
    }

    void reset( X* newPtr ) {
        if ( ptr != newPtr ) {
            delete ptr;
            ptr = newPtr;
        }
    }
};  // end of SmartPtr class

int main()
{
    X* xp = new X();
    SmartPtr s1( xp );
    SmartPtr s2 = s1;       // test copy const (s2 now owns X object)
    SmartPtr s3;            // use no-arg constructor
    s3 = s2;                // test copy assign (s3 now owns X object)
    return 0;
}
