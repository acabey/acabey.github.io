// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.7  Smart Pointers:  Overloading Of Dereferencing Operators
//
//



//SmartPtr.h

template<class T> class SmartPtr {
    T* ptr;
public:
    explicit SmartPtr( T* p = 0 ) : ptr( p ) {}
    T& operator*() const { return *ptr; }
    T* operator->() const { return ptr; }

    SmartPtr( SmartPtr<T>& other ) : ptr( other.release() ) {}

    SmartPtr operator=( SmartPtr<T>& other ) {
        if ( this != &other )
            reset( other.release() );
        return *this;
    }

    ~SmartPtr() { delete ptr; }

    T* release() { 
       T* oldPtr = ptr;
       ptr = 0;
       return oldPtr;
    }

    void reset( T* newPtr ) {
        if ( ptr != newPtr ) {
            delete ptr;
            ptr = newPtr;
        }
    }
};
